Return-Path: <SRS0=/0ln=RR=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84DCD17122
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Oct 2024 18:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E06EC4CEE7; Mon, 21 Oct 2024 18:34:39 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 246DFC4CEC3
	for <linux-firmware@kernel.org>; Mon, 21 Oct 2024 18:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 246DFC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e305c2987bso45401927b3.0
        for <linux-firmware@kernel.org>; Mon, 21 Oct 2024 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729535677; x=1730140477; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rFcb8rltxucDM0VY2MrSo0XTJGmweYgn/oHDViodxcw=;
        b=DWNvj4Ym8RI49izQH72R2kkr+lO5pPxrtq8GPX2iBkEr3WT9TFgIbw7hWAdsK44nSt
         4ojyxB3dW4+J+t5n/K3BpALzbaFiojC9N98zMoeH417R+nLey9Arhf3vva1wt/MOSEET
         +MrHMAZBUABIsVG5Rz5/x0SywTK9RHJMT2Dw4KEWZiqNfECdZMsrQHsHdNoUJsPeJ1A8
         EVEYWk54oHo5u9WDvN855OHVXpll1HsPawJUiivQd1mFN+JglBjPOvH13PBkujnWfHiy
         /ZqA7fOIlg/XM25dabbUQD11zkSmgkmdMQch0eq1cuIEr42/+w1LOVdclf1RsjiX6rbG
         8VLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729535677; x=1730140477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rFcb8rltxucDM0VY2MrSo0XTJGmweYgn/oHDViodxcw=;
        b=fgdWhIWi/8nwYfPSfPGYksfuUEcmuVBW8RUGMK5U/avWQW49I2nr+BojTXB9IbxIkb
         nMCvHmOdnxqK9/jqRoMrjiFu2KxHHOEuxcOyHY0J/vZQocuOUQZL6sghExPOn8quiE+0
         XnTHglDx26igU46TNj9ujNENkKCXDEn7zOoVYcBmQC16ygnPCXvm/P0msW6fGFYd+Iwd
         h9ucaeN7aS9EMcEss2qeet6mmvThJDp/s+cgPJeQhol+M19i/ZiL0yoy6oUS4TK2igNQ
         i82f5JH4iwMbaBdrkBmT0ZcoyPud8gbm83LSc436c1mPeojfnY7qXmKx5czuBPRPqzwD
         aAEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAFOEWH04f9LyjHC+i/XmDBn0lFlRiI5cYKpOJ0/ycTuhDtHjFiIMf9sz2YGTpcK6aFt37PsjEC5aAG9s3FA==@kernel.org
X-Gm-Message-State: AOJu0YwziJQMBgP8hUdafu4dIyKRJOQ/uKiMRAl/PH42sP5uyezZQUUy
	Rf+e6zOFr18F2s04coL8FKL5/iemo7s+TcLpToVI0s3p8WbIrnw84OUTySkZHebQ9oiVew1haeN
	//Vt7onSye1eGX7J4AjYGXvSsKAl0BUZ/LsOAnw==
X-Google-Smtp-Source: AGHT+IGoryo/V98eUYJVIboovm9PDH29dbaEnlJflrmfDlr9asiqpeu7bAg1da1x9WGMG497Wk7nop6pzhvLW7FRhg0=
X-Received: by 2002:a05:690c:9c07:b0:6e5:9bc2:53a0 with SMTP id
 00721157ae682-6e7d3c0f114mr9738967b3.41.1729535677016; Mon, 21 Oct 2024
 11:34:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241011061606.1612918-1-dmitry.baryshkov@linaro.org>
 <379780f5-bf30-4452-aa9e-f1b6915b6389@quicinc.com> <87plntnwon.fsf@kernel.org>
In-Reply-To: <87plntnwon.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 21 Oct 2024 21:34:27 +0300
Message-ID: <CAA8EJppAiktoPk9hZnDdj5igZ9-D0229WRfwg08y8CPnwerx-g@mail.gmail.com>
Subject: Re: [RFC PULL] ath11k: move WCN6750 firmware to the device-specific subdir
To: Kalle Valo <kvalo@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, Jeff Johnson <jjohnson@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, linux-firmware@kernel.org, 
	ath11k@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Oct 2024 at 21:22, Kalle Valo <kvalo@kernel.org> wrote:
>
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>
> > On 10/10/2024 11:16 PM, Dmitry Baryshkov wrote:
> >
> >> The firmware under ath11k/WCN6750 can not be utilized on other devices using
> >> WCN6750 to provide WiFi (e.g. on the Qualcomm RB3 gen2 board).  This is an
> >> attempt to propose a solution by moving the file into device-specifig subdir.
> >> Other platforms can place firmware files in other subdirs, depending on the
> >> SoC.
> >>
> >> Note, while performing the move I also propose squashing the firmware
> >> file.
>
> I assume you mean squashing the files to wpss.mbn?
>
> >> This is the practice recommended by the msm platform maintainers for the DSP
> >> firmware (not to mention that it also saves us from the extra symlinks). If
> >> Kalle, ath11k maintainer, objects, I will keep the firmware in the split form.
> >>
> >> For now this is an RFC in order to gather opinion form respective platform and
> >> driver maintainers.
> >>
> >> ----------------------------------------------------------------
> >>
> >> The following changes since commit d55315295cccf8ce5dc288a74d75cf09b8063cfc:
> >>
> >>   Merge branch 'superm1/qci-patches' into 'main' (2024-10-10 19:11:13 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/lumag/linux-firmware wcn6750-device-specific
> >>
> >> for you to fetch changes up to abe8c109a2b4c422b627335d124473734c8790d8:
> >>
> >>   ath11k: move WCN6750 firmware to the device-specific subdir (2024-10-10 22:26:20 +0300)
> >>
> >> ----------------------------------------------------------------
> >> Dmitry Baryshkov (1):
> >>       ath11k: move WCN6750 firmware to the device-specific subdir
> >>
> >>  WHENCE                                             |  12 ++----------
> >>  ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} | Bin 5819999 -> 7463728 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b00                      | Bin 340 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b01                      | Bin 6848 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b02                      | Bin 10300 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b03                      | Bin 4096 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b05                      | Bin 164332 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b06                      | Bin 266684 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b07                      | Bin 1176368 -> 0 bytes
> >>  ath11k/WCN6750/hw1.0/wpss.b08                      |   0
> >>  ath11k/WCN6750/hw1.0/wpss.mdt                      | Bin 7188 -> 0 bytes
> >>  11 files changed, 2 insertions(+), 10 deletions(-)
> >>  rename ath11k/WCN6750/hw1.0/{wpss.b04 => sc7280/wpss.mbn} (77%)
>
> So this follow basically the same directory hierarchy as you Dmitry
> implemented for ath10k in commit 5abf259772df ("wifi: ath10k: support
> board-specific firmware overrides"), right? Just making sure we are on
> the same page. I think ath10k/ath11k/ath12k drivers should follow the
> same design as much as possible.

Yes, that was my goal. Having subdirs under the main dir.

>
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b00
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b01
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b02
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b03
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b05
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b06
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b07
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.b08
> >>  delete mode 100644 ath11k/WCN6750/hw1.0/wpss.mdt
> >
> > I'm waiting for Kalle to respond, but at a minimum I suspect our internal
> > firmware tooling would be impacted by this change.
>
> Yeah, most likely we need to update our tools. But we would have to do
> it anyway so I'm not concerned about that.

Ok. If there are no concerns from your side, could you possibly
respond with Acked-by? Then we can unblock and merge this.

> > Kalle, do you have concerns or suggestions on how to handle this issue?
>
> Looks good to me.
>
> Dmitry, if you have the time please take a look at this:
>
> https://patchwork.kernel.org/project/linux-wireless/cover/20241001033053.2084360-1-quic_miaoqing@quicinc.com/
>
> Based on a quick look it seems to do things differently and not really a
> fan of that.

Yes, I'd prefer a subdir rather than this implementation. I'll respond
either today or tomorrow.

-- 
With best wishes
Dmitry
