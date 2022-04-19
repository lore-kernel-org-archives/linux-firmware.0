Return-Path: <SRS0=NY4S=U5=gmail.com=jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B7AC433F5
	for <linux-firmware@archiver.kernel.org>; Tue, 19 Apr 2022 11:47:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26CEAC385A7; Tue, 19 Apr 2022 11:47:24 +0000 (UTC)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83CFEC385A8
	for <linux-firmware@kernel.org>; Tue, 19 Apr 2022 11:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83CFEC385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id d3so10300262ilr.10
        for <linux-firmware@kernel.org>; Tue, 19 Apr 2022 04:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ykcELTPl3yH9J0baO/p4z7jLcOC0M5/r/e8/mBAkHnI=;
        b=e4PhPOdJaJfimlQ4PKP6nvJoOYYDO5nhMeCsGeEv6haqQTg93XVt03aKOL6AoLkFPu
         T5OF1x/pbvAbtUSy4xnD9UX0dMy4WbIsmDYQajjTITQNcuoRUEJPq0ZkhyIGCrGh6uTl
         lb5jV1BjGtJ0mfnl3MUx0I6jIoV9SG7wH0Q42AJiWV1hHf/J/gz0b3ZudKZ9St6jopCH
         nrcJZ5WqvqX4cVLPfupsECzGemmeENF/FC97ESh+M8vuIG9Sf38AVI/rWkn9pIoXXbZB
         i1rWAPJGity0IQT/GHrSyNFItd4Rc3FPnb9HV7zyXrDkP8+lphpYJxetdhi/ZEDR2b2R
         utcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ykcELTPl3yH9J0baO/p4z7jLcOC0M5/r/e8/mBAkHnI=;
        b=e/sscHpM6sm7pG/QQegnIHiJHSkPmwAK6c/4AcgcazTLMpaTqPgN8RXmvb2SGLWFo+
         tD+lNPiFU1fbded05Gqt6AFVJ6JbAv+qUQVYDszbo4k72CBJYngKgG00fqhJUeBaZ2kT
         K/exr81KqSuqqB3Kt3zqVHdHpeS8DLBSqr8IOrf0rkeG66ZcZ3wpdSeLnGCoAO122TVl
         cQh3gtbsaTIwy82hcCzexFsgrMDtSIhpoptRv6yX5LDeowj0g842EXkBdHAaiqKE240d
         kcuvFZ/MQO42VUG9gmXMIxOmvuaHIuR72Woz8blJuj1qhqPh8c0zPA0gBD4+0TeOtRL/
         sPEQ==
X-Gm-Message-State: AOAM531BBk9ePSaN3y7R+fN/O0h3a9JMAzb55SGo4M6zmwXPgzZ678+C
	Qztym4t/1p8DOQfKSFCJXeTFuH9rxSG5ryhXpos=
X-Google-Smtp-Source: ABdhPJy7crHXTaEuQo99Mp/W+v8jrmimjM6PwPT1diOsxifhhFRZWL0zCIlHsG2CEZYe0FG+aqUVV6LKJgGtnE/Liog=
X-Received: by 2002:a05:6e02:b2c:b0:2cc:5f3:5d2c with SMTP id
 e12-20020a056e020b2c00b002cc05f35d2cmr6679560ilu.218.1650368842620; Tue, 19
 Apr 2022 04:47:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220413234845.276726-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220413234845.276726-1-dmitry.baryshkov@linaro.org>
From: Josh Boyer <jwboyer@gmail.com>
Date: Tue, 19 Apr 2022 07:47:11 -0400
Message-ID: <CA+5PVA6c79qh8Cvjy=8Zz2T353sGap1h6P4RtYuA0wp54wWEtw@mail.gmail.com>
Subject: Re: [PULL] qcom: add firmware for APQ8096 SoC
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>, 
	Linux-arm Msm <linux-arm-msm@vger.kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 13, 2022 at 7:48 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hi linux-firmware maintainers,
>
> Please pull the audio and modem DSP firmware for the Qualcomm APQ8096 platform.
> The firmware files come from Dragonboard 820c BSP available at [1] or directly
> from Qualcomm at [2] (registration is required).
>
> [1] http://releases.linaro.org/96boards/dragonboard820c/qualcomm/firmware/linux-board-support-package-r01700.1.zip
> [2] https://developer.qualcomm.com/download/db820c/linux-board-support-package-r01700.1.zip
>
> The following changes since commit 8a2d811764e7fcc9e2862549f91487770b70563b:
>
>   rtl_bt: Add firmware and config files for RTL8852C (2022-04-13 07:10:23 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/lumag/linux-firmware apq8096

Pulled and pushed out.

josh

> for you to fetch changes up to afc44bb26f7656e4bda1b63e530f787ffefb7609:
>
>   qcom: apq8096: add modem firmware (2022-04-14 02:34:16 +0300)
>
> ----------------------------------------------------------------
> Dmitry Baryshkov (2):
>       qcom: apq8096: add aDSP firmware
>       qcom: apq8096: add modem firmware
>
>  WHENCE                  |   6 ++++++
>  qcom/apq8096/adsp.mbn   | Bin 0 -> 10533521 bytes
>  qcom/apq8096/adspr.jsn  |  21 +++++++++++++++++++++
>  qcom/apq8096/adspua.jsn |  21 +++++++++++++++++++++
>  qcom/apq8096/mba.mbn    | Bin 0 -> 213888 bytes
>  qcom/apq8096/modem.mbn  | Bin 0 -> 7434352 bytes
>  qcom/apq8096/modemr.jsn |  21 +++++++++++++++++++++
>  7 files changed, 69 insertions(+)
>  create mode 100644 qcom/apq8096/adsp.mbn
>  create mode 100644 qcom/apq8096/adspr.jsn
>  create mode 100644 qcom/apq8096/adspua.jsn
>  create mode 100644 qcom/apq8096/mba.mbn
>  create mode 100644 qcom/apq8096/modem.mbn
>  create mode 100644 qcom/apq8096/modemr.jsn
