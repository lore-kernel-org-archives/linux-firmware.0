Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D51CC433F5
	for <linux-firmware@archiver.kernel.org>; Mon,  2 May 2022 12:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40BDDC385B4; Mon,  2 May 2022 12:27:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B34CC385B3
	for <linux-firmware@kernel.org>; Mon,  2 May 2022 12:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651494471;
	bh=F22CXtfjaswX/RIVy0o1ELnLuHXBrSDCtvxh5+5BuGk=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=PxNDwE9oveyU1dkcqLh4cINW+Eh/jho7246TTMrIzO44NPvZzLSekeSJpQZGPwo67
	 a641y3elXpADfrjMZ/O1B8rTAbiTZQAPilDI8zYldxULOvPSb+Z8D+B1nhxalx03bw
	 qyJyj1vPSQRd4mV9yZbwa/F4LIz4hHK5pwsgmAKWkhpDxY4a5BiRUHsEYTTvp7Xvc8
	 ds1SuGykfWGqCg7b+QtX1Y36BFpLzinxKchGleY0kQkrwaTs1w/p1TKzLjyI9FQ57X
	 wUP1lnDgcnyXceV2qt+B+t1gB+90WhmPXm51IbRGzGkE7zvAlLA4u5SR/Eb7bPXxIJ
	 z1f8+H9F+NtSg==
Received: by mail-io1-f43.google.com with SMTP id z18so15428831iob.5
        for <linux-firmware@kernel.org>; Mon, 02 May 2022 05:27:51 -0700 (PDT)
X-Gm-Message-State: AOAM530H01beMGE5nM3TdW6K+DzCLr5cwKDQg04vMo4ivl+dmwphxWm/
	ru/LTAEEkos0XBaIb4b1oIcPXwE8JEKGXfesVu0=
X-Google-Smtp-Source: ABdhPJy6t3KWKaYJ/+ayQK5srFzIHgzPp9J45DJXokkT0gGFaZugQR5BjiCAz6jLjhtEgaFfvbzBdBYkU9JgpMfxSqU=
X-Received: by 2002:a02:a507:0:b0:32b:543:d66 with SMTP id e7-20020a02a507000000b0032b05430d66mr4435964jam.146.1651494470248;
 Mon, 02 May 2022 05:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220426204528.3005774-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220426204528.3005774-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 2 May 2022 08:27:39 -0400
X-Gmail-Original-Message-ID: <CA+5PVA6XxM4eGLL4oOx3g5hxn1Yv7xnhz8K4rKAOdL-4bivSQQ@mail.gmail.com>
Message-ID: <CA+5PVA6XxM4eGLL4oOx3g5hxn1Yv7xnhz8K4rKAOdL-4bivSQQ@mail.gmail.com>
Subject: Re: [PULL] qcom: add firmware for several Adreno generation
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Rob Clark <robdclark@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 4:45 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Please pull the firmware for several generation of Adreno GPU (A220, A330,
> A405/A420/A430).
>
> The firmware files come from Dragonboard 820c BSP available at [1] or directly
> from Qualcomm at [2] (registration is required).
>
> [1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
> [2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip
>
> The following changes since commit ac21ab5d1de0de34201c90d32eee436f873d1e5b:
>
>   Mellanox: Add lc_ini_bundle for xx.2010.1006 (2022-04-25 07:36:16 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware adreno-firmware
>
> for you to fetch changes up to dfa3c4c30996376dbc3adb530c0505b2efad583b:
>
>   qcom: add firmware files for Adreno a420 & related generations (2022-04-26 23:36:27 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (3):
>       qcom: add firmware files for Adreno a220
>       qcom: add firmware files for Adreno a330
>       qcom: add firmware files for Adreno a420 & related generations

Pulled and pushed out.

josh

>
>  WHENCE               |   6 ++++++
>  qcom/a330_pfp.fw     | Bin 0 -> 2212 bytes
>  qcom/a330_pm4.fw     | Bin 0 -> 9220 bytes
>  qcom/a420_pfp.fw     | Bin 0 -> 4292 bytes
>  qcom/a420_pm4.fw     | Bin 0 -> 9556 bytes
>  qcom/leia_pfp_470.fw | Bin 0 -> 1156 bytes
>  qcom/leia_pm4_470.fw | Bin 0 -> 9220 bytes
>  7 files changed, 6 insertions(+)
>  create mode 100644 qcom/a330_pfp.fw
>  create mode 100644 qcom/a330_pm4.fw
>  create mode 100644 qcom/a420_pfp.fw
>  create mode 100644 qcom/a420_pm4.fw
>  create mode 100644 qcom/leia_pfp_470.fw
>  create mode 100644 qcom/leia_pm4_470.fw
