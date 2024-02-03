Return-Path: <SRS0=iKxV=JM=sdaoden.eu=steffen@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C17EC4828D
	for <linux-firmware@archiver.kernel.org>; Sat,  3 Feb 2024 23:06:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB5EBC433F1; Sat,  3 Feb 2024 23:06:17 +0000 (UTC)
Received: from sdaoden.eu (sdaoden.eu [217.144.132.164])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E6FAC433C7;
	Sat,  3 Feb 2024 23:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E6FAC433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=sdaoden.eu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sdaoden.eu
Date: Sun, 04 Feb 2024 00:06:01 +0100
Author: Steffen Nurpmeso <steffen@sdaoden.eu>
From: Steffen Nurpmeso <steffen@sdaoden.eu>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>,
 Steffen Nurpmeso <steffen@sdaoden.eu>
Subject: Re: Question: v20231111 adds rdfind dependency: why not at
 ball build time?
Message-ID: <20240203230601.F2O6TNp0@steffen%sdaoden.eu>
In-Reply-To: <20240103194300.jKoOqQ-g@steffen%sdaoden.eu>
References: <20231113215300.Fw2CJ%steffen@sdaoden.eu>
 <73529434-9b82-4131-8cbd-05eff75537db@amd.com>
 <20231117011925.PPRKHhpq@steffen%sdaoden.eu>
 <20231117014630.lO5xbFXr@steffen%sdaoden.eu>
 <20231216223619.nRgZNdqv@steffen%sdaoden.eu>
 <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=6WmHo76LZsBRe3gvt5og@mail.gmail.com>
 <20240102221621.YaA1nlef@steffen%sdaoden.eu>
 <20240103194300.jKoOqQ-g@steffen%sdaoden.eu>
Mail-Followup-To: linux-firmware@kernel.org,
 Josh Boyer <jwboyer@kernel.org>, Steffen Nurpmeso <steffen@sdaoden.eu>
User-Agent: s-nail v14.9.24-596-g7894190075
OpenPGP: id=EE19E1C1F2F7054F8D3954D8308964B51883A0DD;
 url=https://ftp.sdaoden.eu/steffen.asc; preference=signencrypt
BlahBlahBlah: Any stupid boy can crush a beetle. But all the professors in
 the world can make no bugs.
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello again,

i though i ask again after a month has passed.

Steffen Nurpmeso wrote in
 <20240103194300.jKoOqQ-g@steffen%sdaoden.eu>:
 |Steffen Nurpmeso wrote in
 | <20240102221621.YaA1nlef@steffen%sdaoden.eu>:
 ||Josh Boyer wrote in
 || <CA+5PVA7fCsgSAYDcMq4NSC4u1ax0f=3D6WmHo76LZsBRe3gvt5og@mail.gmail.com>:
 |||On Sat, Dec 16, 2023 at 5:36=E2=80=AFPM Steffen Nurpmeso <steffen@sdaod=
en.eu> \
 |||wrote:
 |||> Thank you very much for making rdfind an optional thing!
 ...
 |Anyhow.  This diff should also work on github, or wherever "make
 |dist" is run, since cksum, sort, cp, find and xargs should all be
 |available by default.

Is there anything i can do to bring this forward?
I mean, copy-firmware.sh would loose the (now soft) dependency to
rdfind, replacing it with all-POSIX and by-default programs.
I could remove the zstd(1) adjustment (which brings linux-firmware
into alignment with the linux kernel), other than that it seems to
be fine?  Really no interest in keeping the functionality but
without rdfind that is needed for no other purpose?

Ciao already here,

 |--- copy-firmware.sh.orig     2024-01-02 22:30:43.000000000 +0100
 |+++ copy-firmware.sh  2024-01-03 20:38:58.157253235 +0100
 |@@ -40,7 +40,7 @@ while test $# -gt 0; do
 |                 exit 1
 |             fi
 |             # shellcheck disable=3DSC2209
 |-            compress=3D"zstd --compress --quiet --stdout"
 |+            compress=3D"zstd -T0 --ultra -22 --compress --quiet --stdout"
 |             compext=3D".zst"
 |             shift
 |             ;;
 |@@ -75,13 +75,6 @@ if [ -z "$destdir" ]; then
 |  exit 1
 | fi
 |=20
 |-if ! command -v rdfind >/dev/null; then
 |-     if [ "$skip_dedup" !=3D 1 ]; then
 |-             echo "ERROR: rdfind is not installed.  Pass --ignore-dupli\
 |cates to skip deduplication"
 |-             exit 1
 |-     fi
 |-fi
 |-
 | # shellcheck disable=3DSC2162 # file/folder name can include escaped sym=
bols
 | grep -E '^(RawFile|File):' WHENCE | sed -E -e 's/^(RawFile|File): \
 | */\1 /;s/"//g' | while read k f; do
 |     test -f "$f" || continue
 |@@ -89,20 +82,34 @@ grep -E '^(RawFile|File):' WHENCE | sed
 |     $verbose "copying/compressing file $f$compext"
 |     if test "$compress" !=3D "cat" && test "$k" =3D "RawFile"; then
 |         $verbose "compression will be skipped for file $f"
 |-        cat "$f" > "$destdir/$f"
 |+        cp "$f" "$destdir/$f"
 |+    elif [ "$compress" =3D cat ]; then
 |+        cp "$f" "$destdir/$f"
 |     else
 |         $compress "$f" > "$destdir/$f$compext"
 |     fi
 | done
 |=20
 |-if [ "$skip_dedup" !=3D 1 ] ; then
 |+if [ "$skip_dedup" !=3D 1 ]; then
 |  $verbose "Finding duplicate files"
 |-     rdfind -makesymlinks true -makeresultsfile false "$destdir" >/dev/\
 |null
 |-     find "$destdir" -type l | while read -r l; do
 |-             target=3D"$(realpath "$l")"
 |-             $verbose "Correcting path for $l"
 |-             ln -fs "$(realpath --relative-to=3D"$(dirname "$(realpath \
 |-s "$l")")" "$target")" "$l"
 |-     done
 |+    (
 |+    cd "$destdir" && find . -type f | xargs cksum | sort | {
 |+        ls=3D lf=3D
 |+        while read s1 s2 f; do
 |+            s=3D"$s1 $s2"
 |+            #$verbose $s $f
 |+            if [ "$s" =3D "$ls" ] && cmp "$lf" "$f"; then
 |+                $verbose 'duplicate '"${lf##*/}" "${f#./*}"
 |+                rm -f "$f"
 |+                #ln -s "${lf#./*}" "${f#./*}"
 |+                ln -sf "${lf##*/}" "${f#./*}"
 |+            else
 |+                ls=3D$s
 |+                lf=3D$f
 |+            fi
 |+        done
 |+    }
 |+    )
 | fi
 |=20
 | # shellcheck disable=3DSC2162 # file/folder name can include escaped sym=
bols

--steffen
|
|Der Kragenbaer,                The moon bear,
|der holt sich munter           he cheerfully and one by one
|einen nach dem anderen runter  wa.ks himself off
|(By Robert Gernhardt)
