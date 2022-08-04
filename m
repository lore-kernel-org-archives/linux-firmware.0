Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D726FC19F2B
	for <linux-firmware@archiver.kernel.org>; Thu,  4 Aug 2022 11:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4CF8C4347C; Thu,  4 Aug 2022 11:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F8EEC433D7
	for <linux-firmware@kernel.org>; Thu,  4 Aug 2022 11:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659613834;
	bh=Bnou2jzmwx0nzGV/P916qONfgbmZq90KzxpFOcgJi8A=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=k9AuJ91y0Q1T2BKUi6sPjY8kkkv29CmTtdGuAYi7JQfediLjCEsD1KTjyW7c9MX/C
	 KnVcNcVrIbkICLWTIFOc7xvDZXOZBe/VCp5Z7L9hhg8MsgFKJFUeFjNUOr0ZmobquL
	 thVY5YNpKE2e6pbDV7L6WVojtfP5HNhwBri8KpwtgXRNFh6x1jd4UFITCD6Xu9oCey
	 iiFAQzwV/7S49b9r8tbJrUML4bMAPUSnIrQ7hXRVYf1rUu/ud356NuC2F/0KRWIMjj
	 TIZVjjV/jdqBlmPkT/xl62HS+XvKTIvysUlc0ieoB+9A8MH5o4mdlmy/TyWqfF64JU
	 FZtW5XlEuwSrw==
Received: by mail-io1-f52.google.com with SMTP id p82so799063iod.2
        for <linux-firmware@kernel.org>; Thu, 04 Aug 2022 04:50:34 -0700 (PDT)
X-Gm-Message-State: ACgBeo35i4ogH0WVMhxtHVlQhM74uPPQjQ/mZK5xmBYB4W9HYPeO3CHz
	UX7MjcpdYo4upyEh7WlxOfkXy0mn+8ZjNd8MKlY=
X-Google-Smtp-Source: AA6agR5KsI5E0O6cQZryXT0442sPswVkB+TeLlcxQ0+mugtevpP1K1TXfNsR5XRUnUjSYQU2ejS2yhSO0YDzGiuH+LQ=
X-Received: by 2002:a05:6602:2b8a:b0:67b:c57f:b4bc with SMTP id
 r10-20020a0566022b8a00b0067bc57fb4bcmr617282iov.55.1659613833687; Thu, 04 Aug
 2022 04:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
In-Reply-To: <9a79936b-70e2-f964-55ac-e2be8e9346ed@lenovo.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 4 Aug 2022 07:50:22 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6NCSn6ZsVELY0-mW9v82n6Xro2eVkMAcx=LppgMMC2UQ@mail.gmail.com>
Message-ID: <CA+5PVA6NCSn6ZsVELY0-mW9v82n6Xro2eVkMAcx=LppgMMC2UQ@mail.gmail.com>
Subject: Re: qcom: Add firmware for Lenovo ThinkPad X13s
To: Mark Pearson <markpearson@lenovo.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, bjorn.andersson@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 3, 2022 at 4:37 PM Mark Pearson <markpearson@lenovo.com> wrote:
>
> The following changes since commit 150864a4d73e8c448eb1e2c68e65f07635fe1a66:
>
>   amdgpu partially revert "amdgpu: update beige goby to release 22.20"
> (2022-07-25 14:16:04 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/mrhpearson/linux-firmware lenovo-thinkpad-x13s
>
> for you to fetch changes up to 4ae4ae88918928e15006eb129ad981aa58216b59:
>
>   qcom: Add firmware for Lenovo ThinkPad X13s (2022-08-03 16:29:07 -0400)
>
> ----------------------------------------------------------------
> Mark Pearson (1):
>       qcom: Add firmware for Lenovo ThinkPad X13s
>
>  WHENCE                             |   8 ++++++++
>  qcom/LENOVO/21BX/adspr.jsn         |  28 ++++++++++++++++++++++++++++
>  qcom/LENOVO/21BX/adspua.jsn        |  29 +++++++++++++++++++++++++++++
>  qcom/LENOVO/21BX/battmgr.jsn       |  22 ++++++++++++++++++++++
>  qcom/LENOVO/21BX/cdspr.jsn         |  22 ++++++++++++++++++++++
>  qcom/LENOVO/21BX/qcadsp8280.mbn    | Bin 0 -> 14367860 bytes
>  qcom/LENOVO/21BX/qccdsp8280.mbn    | Bin 0 -> 3575808 bytes
>  qcom/LENOVO/21BX/qcdxkmsuc8280.mbn | Bin 0 -> 14392 bytes
>  qcom/LENOVO/21BX/qcslpi8280.mbn    | Bin 0 -> 6213632 bytes
>  9 files changed, 109 insertions(+)
>  create mode 100644 qcom/LENOVO/21BX/adspr.jsn
>  create mode 100644 qcom/LENOVO/21BX/adspua.jsn
>  create mode 100644 qcom/LENOVO/21BX/battmgr.jsn
>  create mode 100644 qcom/LENOVO/21BX/cdspr.jsn
>  create mode 100755 qcom/LENOVO/21BX/qcadsp8280.mbn
>  create mode 100755 qcom/LENOVO/21BX/qccdsp8280.mbn
>  create mode 100755 qcom/LENOVO/21BX/qcdxkmsuc8280.mbn
>  create mode 100755 qcom/LENOVO/21BX/qcslpi8280.mbn
> [banther@p1g4 linux-firmware]$ git log -1
> commit 4ae4ae88918928e15006eb129ad981aa58216b59 (HEAD ->
> lenovo-thinkpad-x13s)
> Author: Mark Pearson <markpearson@lenovo.com>
> Date:   Wed Aug 3 13:49:42 2022 -0400
>
>     qcom: Add firmware for Lenovo ThinkPad X13s
>
>     Add runtime loaded firmware for the audio, compute and sensor DSPs, as
>     well as the zap shader for the GPU on the Lenovo ThinkPad X13s.
>
>     The files are placed under qcom/ as some distributions distribute
>     linux-firmware as multiple packages and the qcom-specific package will
>     be needed to provide some of the shared GPU files.
>
>     Signed-off-by: Mark Pearson <markpearson@lenovo.com>

Just so I make sure I understand, is the firmware provided by Qualcomm
itself, or did Lenovo author it?  As of right now, it looks like
Lenovo releasing Qualcomm firmware under the existing LICENSE.qcom,
which is slightly odd.  Normally we'd like to see a Signed-off-by or
Reviewed-by statement from the owner of the firmware if a partner
company is releasing it to ensure it was intended to be released.

josh
