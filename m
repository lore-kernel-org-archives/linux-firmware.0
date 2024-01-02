Return-Path: <SRS0=LEQj=IM=sdaoden.eu=steffen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB20C46CD2
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Jan 2024 22:16:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2E4BEC433C9; Tue,  2 Jan 2024 22:16:37 +0000 (UTC)
Received: from sdaoden.eu (sdaoden.eu [217.144.132.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26A73C433C8;
	Tue,  2 Jan 2024 22:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26A73C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sdaoden.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sdaoden.eu
Date: Tue, 02 Jan 2024 23:16:21 +0100
Author: Steffen Nurpmeso <steffen@sdaoden.eu>
From: Steffen Nurpmeso <steffen@sdaoden.eu>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Steffen Nurpmeso <steffen@sdaoden.eu>
Subject: Re: Question: v20231111 adds rdfind dependency: why not at
 ball build time?
Message-ID: <20240102221621.YaA1nlef@steffen%sdaoden.eu>
In-Reply-To: <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=6WmHo76LZsBRe3gvt5og@mail.gmail.com>
References: <20231113215300.Fw2CJ%steffen@sdaoden.eu>
 <73529434-9b82-4131-8cbd-05eff75537db@amd.com>
 <20231117011925.PPRKHhpq@steffen%sdaoden.eu>
 <20231117014630.lO5xbFXr@steffen%sdaoden.eu>
 <20231216223619.nRgZNdqv@steffen%sdaoden.eu>
 <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=6WmHo76LZsBRe3gvt5og@mail.gmail.com>
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

Hello.

Josh Boyer wrote in
 <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=3D6WmHo76LZsBRe3gvt5og@mail.gmail.com>:
 |On Sat, Dec 16, 2023 at 5:36=E2=80=AFPM Steffen Nurpmeso <steffen@sdaoden=
.eu> \
 |wrote:
 |> Thank you very much for making rdfind an optional thing!
 |>
 |> I still have not understood why this complicated mechanism is
 |> applied twice, for both creating a distribution tarball and then
 |> again on the user box, instead of maybe (if it really has to be
 |> done that hard) doing a final find(1) run during tarball creation,
 |> and creating a schedule what to cp(1) and what to ln(1) -s (and
 |> where to, of course), however.
 |
 |The tarball is created automatically by kernel.org infrastructure
 |based on a signed git tag.  The maintainers do not have access to the
 |backend that creates the tarball, so we can't run rdfind during
 |creation.

Ah!  Now i understand what Mario Limonciello said!

Hm.  Are you interested in a patch that uses the cksum(1) that is
installed everywhere (except that stdout whitespace needs to be
normalized no Sun/Solaris)?  Ie, simply find(1) all files, and
place their cksum(1) with path in a file, sort(1) that, and then
work it linewise, causing identical follow-ups to become symbolic
links?  (Or rather, add another cmp(1) to be absolutely sure?)
Then store that file in the tarball and work the recipe on user
boxes?

 |> But i wanted to say thank you, and then i was wondering why the
 |> Linux kernel uses --ultra -22 for zstd(1), whereas Linux-firmware
 |> uses a very, very low number.  Also note that zstd(1) -T0 works
 |> regardless of whether SMP is compiled in or not, last time
 |> i looked, it is simply ignored without.  And it is very helpful,
 |> especially with --ultra -22 and on a modern box.
 |
 |I'm honestly not sure.  You'd have to ask the author of the commit
 |that introduced zstd support as to why they chose those numbers.

Thanks for the answer anyway!

 |josh
 --End of <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=3D6WmHo76LZsBRe3gvt5og@mail.gmail\
 .com>

Ok.  I have *never* tried it with rdfind, so the actual symbolic
link may not have the desired value (see commented out thing), but
isn't this essentially what is desired?
It only uses cksum, find, sort, etc, and can be run when creating
the tarball: on the target host no more utilities have to run at
all, simply unpack the tarball??
(Except: compression.  make install: should simply find(1) -type
f and call compressor if so desired??)

--- Makefile.orig	2024-01-02 22:30:37.367929396 +0100
+++ Makefile	2024-01-02 23:11:28.864549352 +0100
@@ -14,7 +14,7 @@ check:
=20
 dist:
 	@mkdir -p release dist
-	./copy-firmware.sh release
+	DIST_CREATE=3Dy ./copy-firmware.sh release
 	@TARGET=3Dlinux-firmware_`git describe`.tar.gz; \
 	cd release && tar -czf ../dist/$${TARGET} *; \
 	echo "Created dist/$${TARGET}"
--- copy-firmware.sh.orig	2024-01-02 22:30:43.584595944 +0100
+++ copy-firmware.sh	2024-01-02 23:12:17.457881758 +0100
@@ -11,6 +11,8 @@ compress=3Dcat
 compext=3D
 skip_dedup=3D0
=20
+: ${dist_create:=3D$DIST_CREATE}
+
 while test $# -gt 0; do
     case $1 in
         -v | --verbose)
@@ -40,7 +42,7 @@ while test $# -gt 0; do
                 exit 1
             fi
             # shellcheck disable=3DSC2209
-            compress=3D"zstd --compress --quiet --stdout"
+            compress=3D"zstd -T0 --ultra -22 --compress --quiet --stdout"
             compext=3D".zst"
             shift
             ;;
@@ -75,13 +77,6 @@ if [ -z "$destdir" ]; then
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
@@ -89,20 +84,34 @@ grep -E '^(RawFile|File):' WHENCE | sed
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
+if [ "$skip_dedup" !=3D 1 ] && [ -n "$DIST_CREATE" ]; then
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
+                ln -s "${lf##*/}" "${f#./*}"
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
