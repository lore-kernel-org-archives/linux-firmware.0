Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C061BC678D5
	for <linux-firmware@archiver.kernel.org>; Tue,  7 Mar 2023 14:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A8A98C4339E; Tue,  7 Mar 2023 14:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9300EC433D2
	for <linux-firmware@kernel.org>; Tue,  7 Mar 2023 14:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678200829;
	bh=J0klgbd1Ldtg0Ehqd6ftfrKzyI0DRZhTRegdB1PNFhY=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=mT6OQt95tViu4c7ZM2aMi5dsi9iuZitmJvLMz507N4OjDhxwX3gAauZnXf0oe5kFL
	 4JBDeX9LvL79S4pGw5/uCmEdUHJPzhv2I9gWItN4mMm/jPkvuhe9e9+YfjkePz02Zk
	 zFJrEhePOAgJONKN/ji9Q8od/LejKxMeR9BJ9UX4m/bGqZi5FYXLN0XoILv+7vTxqc
	 SR9owt2tO5NYu5If88/3Y/Fq8XLKt/SETQXRaAqtpcBICDZgv7yTMNfjBxAtc0Z+sd
	 z7bVApK/kQbfKe4kU2+v8XkrbkDtfUkfQNWbdY4AKh3O2c8dSWCHxoITrPTsFNN/8L
	 H8lRxUSg/CtyQ==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-536bbe5f888so248875337b3.8
        for <linux-firmware@kernel.org>; Tue, 07 Mar 2023 06:53:49 -0800 (PST)
X-Gm-Message-State: AO0yUKX6GhRXqNQxaqwrsXbWn/wPQVkYuYiWtDgBef8FRCDpgLfVd7Cz
	xALgLmke/86KwZoJ6OZGfminTdNXZIAaB1x5qzs=
X-Google-Smtp-Source: AK7set9v5nN9Q5/vTn/YtKQGznG9+r17o2vOF7MvN1nRswZ5vVq3b6/B5cJ7gKYB6aH4pt7PGNXpvccIzmuVmVMMsug=
X-Received: by 2002:a81:ae10:0:b0:535:18be:4126 with SMTP id
 m16-20020a81ae10000000b0053518be4126mr9356816ywh.6.1678200828626; Tue, 07 Mar
 2023 06:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20230301-fixes-and-compression-v2-0-e2b71974e842@gmail.com> <20230301-fixes-and-compression-v2-1-e2b71974e842@gmail.com>
In-Reply-To: <20230301-fixes-and-compression-v2-1-e2b71974e842@gmail.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Tue, 7 Mar 2023 09:53:37 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4Tuw0HxxUxiZJgO-MY3yh-dTTjwxV7QOgO+gSyZ2123Q@mail.gmail.com>
Message-ID: <CA+5PVA4Tuw0HxxUxiZJgO-MY3yh-dTTjwxV7QOgO+gSyZ2123Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 01/16] WHENCE: remove trailing white space
To: emil.l.velikov@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Adam Sampson <ats@offog.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied and pushed out.

josh

On Wed, Mar 1, 2023 at 1:56=E2=80=AFPM Emil Velikov via B4 Relay
<devnull+emil.l.velikov.gmail.com@kernel.org> wrote:
>
> From: Emil Velikov <emil.l.velikov@gmail.com>
>
> Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> ---
>  WHENCE | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>
> diff --git a/WHENCE b/WHENCE
> index e957cc9..205162e 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -395,7 +395,7 @@ Version: 8.07.00 MIDQ
>
>  Licence: Redistributable. See LICENCE.qla2xxx for details
>
> -Available from http://ldriver.qlogic.com/firmware/
> +Available from http://ldriver.qlogic.com/firmware/
>
>  ------------------------------------------------------------------------=
--
>
> @@ -2563,29 +2563,29 @@ Licence: Redistributable. See LICENCE.ueagle-atm4=
-firmware for details
>  Driver: ueagle-atm - Driver for USB ADSL Modems based on Eagle I,II,III
>
>  File: ueagle-atm/930-fpga.bin
> -File: ueagle-atm/CMVeiWO.bin
> -File: ueagle-atm/CMVepFR10.bin
> -File: ueagle-atm/DSP9p.bin
> +File: ueagle-atm/CMVeiWO.bin
> +File: ueagle-atm/CMVepFR10.bin
> +File: ueagle-atm/DSP9p.bin
>  File: ueagle-atm/eagleIII.fw
> -File: ueagle-atm/adi930.fw
> -File: ueagle-atm/CMVep.bin
> -File: ueagle-atm/CMVepFR.bin
> +File: ueagle-atm/adi930.fw
> +File: ueagle-atm/CMVep.bin
> +File: ueagle-atm/CMVepFR.bin
>  File: ueagle-atm/DSPei.bin
> -File: ueagle-atm/CMV9i.bin
> -File: ueagle-atm/CMVepES03.bin
> -File: ueagle-atm/CMVepIT.bin
> +File: ueagle-atm/CMV9i.bin
> +File: ueagle-atm/CMVepES03.bin
> +File: ueagle-atm/CMVepIT.bin
>  File: ueagle-atm/DSPep.bin
> -File: ueagle-atm/CMV9p.bin
> -File: ueagle-atm/CMVepES.bin
> -File: ueagle-atm/CMVepWO.bin
> +File: ueagle-atm/CMV9p.bin
> +File: ueagle-atm/CMVepES.bin
> +File: ueagle-atm/CMVepWO.bin
>  File: ueagle-atm/eagleI.fw
> -File: ueagle-atm/CMVei.bin
> -File: ueagle-atm/CMVepFR04.bin
> -File: ueagle-atm/DSP9i.bin
> +File: ueagle-atm/CMVei.bin
> +File: ueagle-atm/CMVepFR04.bin
> +File: ueagle-atm/DSP9i.bin
>  File: ueagle-atm/eagleII.fw
>  Version: 1.1
>
> -Licence: Redistributable. Based on
> +Licence: Redistributable. Based on
>           https://mail.gna.org/public/eagleusb-dev/2004-11/msg00172.html
>
>  ------------------------------------------------------------------------=
--
> @@ -3951,7 +3951,7 @@ License:
>
>    This SDD ("Static Dynamic Data") file is licensed strictly for use wit=
h
>    the Sagrad WiFi modules (such as the SG901-1091/1098) that utilize the
> -  cw1200 driver. There is no warranty expressed or implied about its
> +  cw1200 driver. There is no warranty expressed or implied about its
>    fitness for any purpose.
>
>    Permission is hereby granted for the distribution of this SDD file as
>
> --
> 2.39.2
>
