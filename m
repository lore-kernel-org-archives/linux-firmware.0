Return-Path: <SRS0=4ZzB=S3=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F13BD78318
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Dec 2024 12:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D45ADC4CED2; Mon,  2 Dec 2024 12:46:23 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92CD8C4CED1
	for <linux-firmware@kernel.org>; Mon,  2 Dec 2024 12:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92CD8C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53de6b7da14so4180211e87.0
        for <linux-firmware@kernel.org>; Mon, 02 Dec 2024 04:46:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733143581; x=1733748381; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GaYCukmgMxDA5taJqCLpictvWOWvPCBn33S0g48RWIg=;
        b=YA69TxcZ4EbK3kgA766u4yVVflkTU9KMhqtLwqJE6MXME9gri+J54fafqSvHAYuQCH
         L1co7nxG9MxyzXLLZIuz1H+W9QaWALFQJvXrPX/nBtgvfYcc6MN60vPXATRyoJDJ09sT
         lHoRmXPBs4relGn1SS/4OiLDYSZNmhR+LRNABEVc2WWY4NiP7OjZoiQICQm4xoct5tvC
         lvbXx25vXgt1nZtUkoogAeE4WhewQT5DByQsUYhR5q1ArgONHOO+oNfTrQeM0jJv6dHQ
         BczIs4O5gPfi/9uqwauqR4lvaf/B9vmPjfgj1P8VP//ODSfjMfddZGKH8zDAm3ozHOmn
         RJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733143581; x=1733748381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaYCukmgMxDA5taJqCLpictvWOWvPCBn33S0g48RWIg=;
        b=caL1HmPhiZpwS16Ta7ShnVRMlZw3sdiIcgFZp3gfNaVLsq2TwHiHoEtVScus5vulyL
         Oi9+BWG2OVO3bJY47/cvjElVRCtBDybm1633SBL5p35aj5adSO1VKl+F2yE6/9LEHezT
         8uTtSxq35DrDWVOmey4hjB9hdvrkxrcQGzJf7rG26j6/3+OkXG8WaZ+NJeYRUfx0O4tX
         nyLeHAer7f3YzqlK98olv8/ChLa/XXP8CIVjFY6GDrUwqhgurO3rCT7ByyUOo15IBzRG
         nB3c+SuSZEhgnBpqasBWySD+FohY22mMJIJH0+mRub9Vn/LnsPpILcz1s45s4wNLR87N
         rqSg==
X-Forwarded-Encrypted: i=1; AJvYcCV/4fC9yupy00IVfbgW8hPzUNn9qPIdjNCZwKTKdb9oLG/I7taOGfmb8/mouSXI5FK1SQobvrfIPDbElNk2xw==@kernel.org
X-Gm-Message-State: AOJu0YxSaY4JkkyvOxsq2PoYH8dB/o/ekHwEVk+qDF/dFj08l8/KEvTc
	waVjrtmxE8e4xSthG50PbjFunzWsGzWdXIl1wXOwuq+gp94PyDOiKceP5W/a/zQ=
X-Gm-Gg: ASbGncur563BNLpovtpjy1zaH4m74fZVZicRl9kgaufWGWAZly8eVtbVuxmIJVK3sYP
	i+NwSBqUKVO6FS1yPckHHqqwPGnXbQ+FG0yhyusHm/vYXRFsmS95kd+h/DKz+pCj8xs0ACX71QN
	aoCZ9H6Whde2Pl6tiY/+Z3EUnGQYATSc//n1YNXQDe/FvegaMXfhAq5MIA1BF4os7xGUJjhxmmC
	xB0GhXBNTRXdVG0zFCt+GAEQ0U/WrnajyU7D/yfV4CXIvOz5Byr64Yad9/2jTwdPyIu746EE1bB
	KrfRhpjkrzydKwBf98Pc6B2qG7c4tQ==
X-Google-Smtp-Source: AGHT+IE1voE10D3iwYWwwQY3sK3Nf80iiVJk54y47WLDhdouHdUsNe2wedZKcAAFSKP/Pfj0eKxIFg==
X-Received: by 2002:a05:6512:b8d:b0:53d:dd02:7cc5 with SMTP id 2adb3069b0e04-53df00c6440mr7027271e87.7.1733143580677;
        Mon, 02 Dec 2024 04:46:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646f257sm1429639e87.122.2024.12.02.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 04:46:19 -0800 (PST)
Date: Mon, 2 Dec 2024 14:46:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <magmzevx4cisi5s2ytdtzsqr6klrt6wot6cex3zpxugjspdwyt@qpooycw4b2bs>
References: <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
 <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
 <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
 <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
 <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com>

On Mon, Dec 02, 2024 at 05:30:55PM +0530, Vikash Garodia wrote:
> Hi Dmitry,
> 
> On 11/29/2024 8:05 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> >> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> >>>
> >>> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> >>>> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >>>>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>>>>
> >>>>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>>>>> Hello
> >>>>>>>>>>
> >>>>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>>>>
> >>>>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>>>>
> >>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>
> >>>>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>>>>
> >>>>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>>>>
> >>>>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>>>>
> >>>>>>>>>> ----------------------------------------------------------------
> >>>>>>>>>> Renjiang Han (1):
> >>>>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>>>>
> >>>>>>>>>> WHENCE                      |   1 +
> >>>>>>>>>
> >>>>>>>>> Could you please be more specific, what is the difference between the
> >>>>>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>>>>
> >>>>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>>>>> use v5 signatures?
> >>>>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>>>>> far i have seen 2 categories in signing version for video bins, either default
> >>>>>> or v6 specific tool.
> >>>>>
> >>>>> Can firmware / security engineers actually advice us on using v5
> >>>>> firmware signatures with QCS615 _and_ with older platforms?
> >>>>> Existing venus-5.4/venus.mbn uses v3
> >>>>
> >>>> Vikash, any updates on this topic? Would it be possible to have a single
> >>>> FW image with just v5 signatures?
> >>> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> >>> the signing requirements across different SOCs, hopefully will be able to add
> >>> something on this by then.
> > 
> > It's been more than a week since the last email. Are there any updates?
> > I'd really like to get this sorted out before next linux-firmware
> > release, otherwise we'll be stuck with these names for the foreseeable
> > future.
> I have been chasing both the firmware and security folks to align on this. So
> far the updates are that one is signed MBNv5 and other with MBNV6, hence leading

I think the existing firmware uses v3, not v5.

00001000  00 00 00 00 03 00 00 00  00 00 00 00 28 00 a0 0f  |............(...|


> to different set of binaries. These MBN versions of signing is defined at SOC
> level and depends on secure boot libraries used in that SOC.
> At the same time, there is an experiment to check if SC7180 can be signed with
> version used for QCS615 i.e MBNV6.

Thanks! Are you trying that without updating the whole bootloader stack? I
think some of SC7180 devices might be EOL'd, so it might be hard to get
FW/bootloader updates.

> One query here - given that qcs615 only loads the venus_s6.mbn variant, and it
> is not enabled yet (patches in review) for video, we should be good if we
> conclude the firmware part before accepting the qcs615 enablement patches ?

Good question. I think that depends on linux-firmware maintainer's
opinion.

-- 
With best wishes
Dmitry
