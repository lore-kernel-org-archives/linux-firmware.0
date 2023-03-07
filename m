Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689F6C678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 14:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B9E2C433A4; Tue,  7 Mar 2023 14:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323F0C433A0
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678201116;
	bh=k1GKav7xKTRT0mYVvYaJJzZB9LKMME8V12FvWLX6GlA=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=OZqwojc336E7CGt863ErrEzX2fZQFeuHmFVx2v8PqkgY5dlnnjDW0AVs+RFygXlAw
	 gAjSvJqSt6Pp4ts7k26HK0RXcPwV/u/6gmkaD2lJ4zJ0V1IWLATKenMGimeT3UBLp2
	 B3sRNOKlmADITnKFqynxpsz7C9GEx/Q3MqtTpPgZgADEk9ZVaq5cM9qXc/TvMXwTWN
	 WkHDcFNWMcwyx2jWOv9Tbf1wvKat2cEtKYGtoUurZGYtBhqi0utONSDBVeyATDEwW1
	 OBL3WyhXwPPN26ZmyyXshPo+vJrDOqN+R6V8nD5eft8D8wsae6nwlzD/76OBSSSUg0
	 Th0kMph81zmUw==
Received: by mail-yb1-f170.google.com with SMTP id y144so11612772yby.12
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 06:58:36 -0800 (PST)
X-Gm-Message-State: AO0yUKUJdgbXeRJqZj5DwX7di76rPwUfsQNvSnI6oEFjyj6s4UEiDwGv
	coadgQgZ427jkNgXW1I+li7ExsDlT1N+zcZ7RnU=
X-Google-Smtp-Source: AK7set9AgFJkF6ZdH/HWgSbiV62lHUhUT7iWfv1Yz27HZCWVLo8DgsHDG5ExgfKgPFmx2VLBo43xUK22yIDxrWh+0t8=
X-Received: by 2002:a25:910f:0:b0:afd:66d8:a495 with SMTP id
 v15-20020a25910f000000b00afd66d8a495mr5111303ybl.0.1678201115208; Tue, 07 Mar
 2023 06:58:35 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-3-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-3-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 09:58:24 -0500
X-Gmail-Original-Message-ID: <CA+5PVA7OGYgFxgCACKfZ67ap+Q5kXzVWKVL96MR5QAu2u_P-Tg@mail.gmail.com>
Message-ID: <CA+5PVA7OGYgFxgCACKfZ67ap+Q5kXzVWKVL96MR5QAu2u_P-Tg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 03/16] check_whence, WHENCE, copy-firmware:
 escape filenames with spaces
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> From: Emil Velikov <emil.l.velikov@gmail.com>
>
> We have a handful of instances which have space in the filename - just
> escape them (like we do for the symlinks) and drop the extra re pattern.
>
> With this we can also drop the extra sed pattern, stripping out the
> quotation marks.

While that is all true, why is it necessary?  I suspect patch
submitters are far more likely to forget to escape the spaces than
they are to just include quotes.  I see this change as making it
slightly harder to submit correct patches and I'm not sure it's worth
it.

josh

> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  WHENCE           | 10 +++++-----
>  check_whence.py  |  8 ++------
>  copy-firmware.sh |  2 +-
>  3 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index d4654dd..214952e 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -2690,9 +2690,9 @@ Link: brcm/brcmfmac54591-pcie.clm_blob -> ../cypres=
s/cyfmac54591-pcie.clm_blob
>
>  Licence: Redistributable. See LICENCE.cypress for details.
>
> -File: "brcm/brcmfmac43241b4-sdio.Intel Corp.-VALLEYVIEW C0 PLATFORM.txt"
> +File: brcm/brcmfmac43241b4-sdio.Intel\ Corp.-VALLEYVIEW\ C0\ PLATFORM.tx=
t
>  File: brcm/brcmfmac4330-sdio.Prowise-PT301.txt
> -File: "brcm/brcmfmac43340-sdio.ASUSTeK COMPUTER INC.-TF103CE.txt"
> +File: brcm/brcmfmac43340-sdio.ASUSTeK\ COMPUTER\ INC.-TF103CE.txt
>  File: brcm/brcmfmac43340-sdio.meegopad-t08.txt
>  File: brcm/brcmfmac43340-sdio.pov-tab-p1006w-data.txt
>  File: brcm/brcmfmac43340-sdio.predia-basic.txt
> @@ -2703,7 +2703,7 @@ Link: brcm/brcmfmac43362-sdio.kobo,tolino-shine2hd.=
txt -> brcmfmac43362-sdio.WC1
>  Link: brcm/brcmfmac43362-sdio.lemaker,bananapro.txt -> brcmfmac43362-sdi=
o.cubietech,cubietruck.txt
>  File: brcm/brcmfmac43430a0-sdio.ilife-S806.txt
>  File: brcm/brcmfmac43430a0-sdio.jumper-ezpad-mini3.txt
> -File: "brcm/brcmfmac43430a0-sdio.ONDA-V80 PLUS.txt"
> +File: brcm/brcmfmac43430a0-sdio.ONDA-V80\ PLUS.txt
>  File: brcm/brcmfmac43430-sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-plus.txt -> brcmfmac43430-=
sdio.AP6212.txt
>  Link: brcm/brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt -> brcmfmac43430-=
sdio.AP6212.txt
> @@ -2724,9 +2724,9 @@ Link: brcm/brcmfmac43455-sdio.raspberrypi,3-model-a=
-plus.txt -> brcmfmac43455-sd
>  File: brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ 4=
\ Model\ B.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
>  Link: brcm/brcmfmac43455-sdio.Raspberry\ Pi\ Foundation-Raspberry\ Pi\ C=
ompute\ Module\ 4.txt -> brcmfmac43455-sdio.raspberrypi,4-model-b.txt
> -File: "brcm/brcmfmac43455-sdio.MINIX-NEO Z83-4.txt"
> +File: brcm/brcmfmac43455-sdio.MINIX-NEO\ Z83-4.txt
>  File: brcm/brcmfmac4356-pcie.gpd-win-pocket.txt
> -File: "brcm/brcmfmac4356-pcie.Xiaomi Inc-Mipad2.txt"
> +File: brcm/brcmfmac4356-pcie.Xiaomi\ Inc-Mipad2.txt
>  File: brcm/brcmfmac4356-sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.firefly,firefly-rk3399.txt -> brcmfmac4356-=
sdio.AP6356S.txt
>  Link: brcm/brcmfmac4356-sdio.khadas,vim2.txt -> brcmfmac4356-sdio.AP6356=
S.txt
> diff --git a/check_whence.py b/check_whence.py
> index 8805e99..f347f0e 100755
> --- a/check_whence.py
> +++ b/check_whence.py
> @@ -6,13 +6,9 @@ from io import open
>  def list_whence():
>      with open('WHENCE', encoding=3D'utf-8') as whence:
>          for line in whence:
> -            match =3D re.match(r'(?:File|Source):\s*"(.*)"', line)
> +            match =3D re.match(r'(?:File|Source):\s*(.*)', line)
>              if match:
> -                yield match.group(1)
> -                continue
> -            match =3D re.match(r'(?:File|Source):\s*(\S*)', line)
> -            if match:
> -                yield match.group(1)
> +                yield match.group(1).replace("\ ", " ")
>                  continue
>              match =3D re.match(r'Licen[cs]e: (?:.*\bSee (.*) for details=
\.?|(\S*))\n',
>                               line)
> diff --git a/copy-firmware.sh b/copy-firmware.sh
> index bbacb92..6bceef3 100755
> --- a/copy-firmware.sh
> +++ b/copy-firmware.sh
> @@ -31,7 +31,7 @@ while test $# -gt 0; do
>      esac
>  done
>
> -grep '^File:' WHENCE | sed -e's/^File: *//g' -e's/"//g' | while read f; =
do
> +grep '^File:' WHENCE | sed -e's/^File: *//g' | while read f; do
>      test -f "$f" || continue
>      $verbose "copying file $f"
>      install -d $destdir/$(dirname "$f")
>
> --
> 2.39.2
>
