Return-Path: <SRS0=efYu=IN=sdaoden.eu=steffen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20949C3DA6E
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Jan 2024 19:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8313C433C9; Wed,  3 Jan 2024 19:43:07 +0000 (UTC)
Received: from sdaoden.eu (sdaoden.eu [217.144.132.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACF17C433C7;
	Wed,  3 Jan 2024 19:43:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ACF17C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sdaoden.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sdaoden.eu
Date: Wed, 03 Jan 2024 20:43:00 +0100
Author: Steffen Nurpmeso <steffen@sdaoden.eu>
From: Steffen Nurpmeso <steffen@sdaoden.eu>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Steffen Nurpmeso <steffen@sdaoden.eu>
Subject: Re: Question: v20231111 adds rdfind dependency: why not at
 ball build time?
Message-ID: <20240103194300.jKoOqQ-g@steffen%sdaoden.eu>
In-Reply-To: <20240102221621.YaA1nlef@steffen%sdaoden.eu>
References: <20231113215300.Fw2CJ%steffen@sdaoden.eu>
 <73529434-9b82-4131-8cbd-05eff75537db@amd.com>
 <20231117011925.PPRKHhpq@steffen%sdaoden.eu>
 <20231117014630.lO5xbFXr@steffen%sdaoden.eu>
 <20231216223619.nRgZNdqv@steffen%sdaoden.eu>
 <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=6WmHo76LZsBRe3gvt5og@mail.gmail.com>
 <20240102221621.YaA1nlef@steffen%sdaoden.eu>
Mail-Followup-To: Josh Boyer <jwboyer@kernel.org>,
 linux-firmware@kernel.org, Steffen Nurpmeso <steffen@sdaoden.eu>
User-Agent: s-nail v14.9.24-585-g9999e323b6
OpenPGP: id=EE19E1C1F2F7054F8D3954D8308964B51883A0DD;
 url=https://ftp.sdaoden.eu/steffen.asc; preference=signencrypt
BlahBlahBlah: Any stupid boy can crush a beetle. But all the professors in
 the world can make no bugs.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hm, hello again.

Steffen Nurpmeso wrote in
 <20240102221621.YaA1nlef@steffen%sdaoden.eu>:
 |Josh Boyer wrote in
 | <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=3D6WmHo76LZsBRe3gvt5og@mail.gmail.com>:
 ||On Sat, Dec 16, 2023 at 5:36=E2=80=AFPM Steffen Nurpmeso <steffen@sdaode=
n.eu> \
 ||wrote:
 ||> Thank you very much for making rdfind an optional thing!
 ||>
 ||> I still have not understood why this complicated mechanism is

It is a _terrible_ and terribly redundant build system.
But that is not my problem, i will not look into what these
build_packages.py things do...
However my thing from yesterday is wrong in so far as the
duplicates are only removed when run from "make dist", which is at
least once or twice not enough, then.

So please this one simply hammers always (unless dedup is not
desired).  Also it uses -f arg to ln(1) for whatever reason.
Otherwise identical.

Again i personally would instead do copy_firmware.sh once, and do
not create any links during that run at all.  Instead i would
place those with the target in a text file to be shipped along.
At install time (i would look in an "updates" path??) i would run
that recipe and create according (compressed?) links as necessary.
(If "updates" contains file, these have to be taken into account
when doing so, possibly skipping a link, but doing a copy.)

I do no understand how copy-firmware.sh can currently work on
already linked data "when there are updates to take into account"
(and there is a mismatch).

Anyhow.  This diff should also work on github, or wherever "make
dist" is run, since cksum, sort, cp, find and xargs should all be
available by default.

Ciao from Germany!

--- copy-firmware.sh.orig	2024-01-02 22:30:43.000000000 +0100
+++ copy-firmware.sh	2024-01-03 20:38:58.157253235 +0100
@@ -40,7 +40,7 @@ while test $# -gt 0; do
                 exit 1
             fi
             # shellcheck disable=3DSC2209
-            compress=3D"zstd --compress --quiet --stdout"
+            compress=3D"zstd -T0 --ultra -22 --compress --quiet --stdout"
             compext=3D".zst"
             shift
             ;;
@@ -75,13 +75,6 @@ if [ -z "$destdir" ]; then
 	exit 1
 fi
=20
-if ! command -v rdfind >/dev/null; then
-	if [ "$skip_dedup" !=3D 1 ]; then
-    		echo "ERROR: rdfind is not installed.  Pass --ignore-duplicates to s=
kip deduplication"
-		exit 1
-	fi
-fi
-
 # shellcheck disable=3DSC2162 # file/folder name can include escaped symbo=
ls
 grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): */\1 /;s=
/"//g' | while read k f; do
     test -f "$f" || continue
@@ -89,20 +82,34 @@ grep -E '^(RawFile|File):' WHENCE | sed
     $verbose "copying/compressing file $f$compext"
     if test "$compress" !=3D "cat" && test "$k" =3D "RawFile"; then
         $verbose "compression will be skipped for file $f"
-        cat "$f" > "$destdir/$f"
+        cp "$f" "$destdir/$f"
+    elif [ "$compress" =3D cat ]; then
+        cp "$f" "$destdir/$f"
     else
         $compress "$f" > "$destdir/$f$compext"
     fi
 done
=20
-if [ "$skip_dedup" !=3D 1 ] ; then
+if [ "$skip_dedup" !=3D 1 ]; then
 	$verbose "Finding duplicate files"
-	rdfind -makesymlinks true -makeresultsfile false "$destdir" >/dev/null
-	find "$destdir" -type l | while read -r l; do
-		target=3D"$(realpath "$l")"
-		$verbose "Correcting path for $l"
-		ln -fs "$(realpath --relative-to=3D"$(dirname "$(realpath -s "$l")")" "$=
target")" "$l"
-	done
+    (
+    cd "$destdir" && find . -type f | xargs cksum | sort | {
+        ls=3D lf=3D
+        while read s1 s2 f; do
+            s=3D"$s1 $s2"
+            #$verbose $s $f
+            if [ "$s" =3D "$ls" ] && cmp "$lf" "$f"; then
+                $verbose 'duplicate '"${lf##*/}" "${f#./*}"
+                rm -f "$f"
+                #ln -s "${lf#./*}" "${f#./*}"
+                ln -sf "${lf##*/}" "${f#./*}"
+            else
+                ls=3D$s
+                lf=3D$f
+            fi
+        done
+    }
+    )
 fi
=20
 # shellcheck disable=3DSC2162 # file/folder name can include escaped symbo=
ls

--steffen
|
|Der Kragenbaer,                The moon bear,
|der holt sich munter           he cheerfully and one by one
|einen nach dem anderen runter  wa.ks himself off
|(By Robert Gernhardt)
