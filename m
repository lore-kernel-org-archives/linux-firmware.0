Return-Path: <SRS0=4ZzB=S3=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633D9D78321
	for <linux-firmware@archiver.kernel.org>; Mon,  2 Dec 2024 15:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2DBFBC4CED2; Mon,  2 Dec 2024 15:11:45 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A248C4CED9
	for <linux-firmware@kernel.org>; Mon,  2 Dec 2024 15:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A248C4CED9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ffc1f72a5bso44678361fa.1
        for <linux-firmware@kernel.org>; Mon, 02 Dec 2024 07:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733152301; x=1733757101; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fw7YEoYIbKyZeOPjx3DPUW4jWlQB+qg3r3Sh5MM8ZwY=;
        b=A4bfuFBpEiowl0SN83/uM5eo/hkQUrngBsdMR1yezIscXkTHxkdKhqxK7PtWAbZ+Ku
         ZRRhqxT0klh4WR2rkcEdV6b3CPBbHnLAIhfyRXxFGeLNlIBywdTZbnZVhz89vXZNmn5l
         2aWb93mG5JxccuvdAnKoVoblpFT2F0JYepT6cAAWlrboOoQRwe17O7VsSfdxBgdk9XCg
         ajJZepbKLiW4TXRasjj5G5qXAiPXKJNiHPY+BmIKzM1btOhwNeSiLxZYv9aD/u6vkIj1
         69snDfRGi4IsN92iFhvJWfAe4bEeG/FxT9T8Z6oiUIhDY/yewAxavZmtTIxi+2yWMkbP
         LPqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733152301; x=1733757101;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw7YEoYIbKyZeOPjx3DPUW4jWlQB+qg3r3Sh5MM8ZwY=;
        b=o4sksPcQEF3JJvd3zqkCuTygtZyKAEzaOcWUYV0mRWEO6XMBTpNlxqXydyDwiA/k7Q
         RTAWfH8AMyuTCyepr0tepFl1QD6LWJugcFPXCcIcJU3cbZ7w+yYQwX0yjvZ/9Dn2sh4W
         D2yIRg7GkKd6QZnMJ6Tm9dXEHazPohbMqLFjUbgdvtMdKq5DYl74CXhnnIjBQImUn5zd
         4j6oXA4aJP2w5N46yohPniRQNq2UB88ZSZU8Z7YoTJ5pFIlpiw/z2of9ZKyKeNGBbwv3
         hKOkwsdIRmo7ClEmtX4vgAJwgCbPD4P+9Olvx1nxS8MwluSQEP7WWJOuBQL+yxrYoVCf
         Ixng==
X-Forwarded-Encrypted: i=1; AJvYcCX/7tU+3li1DKJ1BUiq1g5WZhdlYPVrwgKucgqXKq/FNd3Mr/RG0GTdW2GULIgWLDRUvQ2M2tyf3/0VMeS3xQ==@kernel.org
X-Gm-Message-State: AOJu0YxtxhKbEGd/zcK/uVOy/1XkTyoqVqGyxUSwDswNsFM60QfIzVns
	vnn1AhBtroqPXcoPQAAsR2RlThKEnVFqM4dJnrumIDWjVhVk9QwHICGOJYycLPs=
X-Gm-Gg: ASbGncs9zPOEzwOwwRvXhbxCHX5eoJviFfDMRyhILQUu+irHPEYWYQSi2xe5Nf3nEme
	2w9MICAwfkOeQwDJerM9UbFCj4WZiRh+a7/MbWl04xABzYo1o1WaniG+QEkudwQ9EXiD9p63QuO
	c6LK43wlTYGTUeg2o1rYcTa8e860cOtF1Se7unLsknKOEumponbUXbjpkeg/bo+bnyppAhsWXpR
	JkN84/nD1NoJ7SWZ2jl1fOephHJXWZ+KwrLB0C+zvKTBMHvvJOGXcUu9tGgSbhvbSCgXMTifEiw
	TAFmQx19TKIUlwuTMqzYnHQF4bvBJw==
X-Google-Smtp-Source: AGHT+IGTOCHVZ8wHsV6r+9tCOEInpxzT1dTiCgbnax192RHUBILvYulxGuD27uXpLfbri9gV662KLg==
X-Received: by 2002:a2e:be8b:0:b0:2ff:4e4b:cbe2 with SMTP id 38308e7fff4ca-2ffde23e3cdmr64660161fa.14.1733152299652;
        Mon, 02 Dec 2024 07:11:39 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfbb915esm13211121fa.19.2024.12.02.07.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:11:38 -0800 (PST)
Date: Mon, 2 Dec 2024 17:11:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: add venus firmware file for qcs615
Message-ID: <cjbdqixxxu2zrgkakcb44jnkeoktwc3vmtqauejnxjxtycqtnp@7cthmlpy5qx3>
References: <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
 <a1bbc1d0-d3bd-e44e-e393-a7ade909a506@quicinc.com>
 <CAA8EJpoDXKbF5cqb_vzE28zjdC6OC66Zxb5j030QXaCe+FUmfw@mail.gmail.com>
 <egdqhgdiqqny57yiauiyekcvhxvebfttyncqoazslzjprwvakz@txvy7wn4vg7g>
 <a259c98c-6c77-1c1e-e428-41c2550f7517@quicinc.com>
 <pukoimsqhck5oymirmgiwad6s3l6frt7xbahp7juhvj3rt4622@wpajx6vyw5nl>
 <rukxa3h72trvqvu6wkxmkp33entybcvxfjlpcjh7odipwds6lq@rt6ferue5nbr>
 <5170f77f-c5d3-02f1-8deb-5d00fef7627a@quicinc.com>
 <magmzevx4cisi5s2ytdtzsqr6klrt6wot6cex3zpxugjspdwyt@qpooycw4b2bs>
 <41f0ebb2-02b9-a83d-6a7d-3dd03fccb687@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41f0ebb2-02b9-a83d-6a7d-3dd03fccb687@quicinc.com>

On Mon, Dec 02, 2024 at 06:20:40PM +0530, Vikash Garodia wrote:
> 
> On 12/2/2024 6:16 PM, Dmitry Baryshkov wrote:
> > On Mon, Dec 02, 2024 at 05:30:55PM +0530, Vikash Garodia wrote:
> >> Hi Dmitry,
> >>
> >> On 11/29/2024 8:05 PM, Dmitry Baryshkov wrote:
> >>> On Wed, Nov 20, 2024 at 01:22:50PM +0200, Dmitry Baryshkov wrote:
> >>>> On Wed, Nov 20, 2024 at 04:40:51PM +0530, Vikash Garodia wrote:
> >>>>>
> >>>>> On 11/20/2024 4:09 PM, Dmitry Baryshkov wrote:
> >>>>>> On Thu, Nov 14, 2024 at 01:31:14PM +0200, Dmitry Baryshkov wrote:
> >>>>>>> On Thu, 14 Nov 2024 at 13:05, Vikash Garodia <quic_vgarodia@quicinc.com> wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 11/14/2024 4:16 PM, Dmitry Baryshkov wrote:
> >>>>>>>>> On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> >>>>>>>>>>
> >>>>>>>>>> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> >>>>>>>>>>> On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >>>>>>>>>>>> Hello
> >>>>>>>>>>>>
> >>>>>>>>>>>> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>>>>>>>>>>>
> >>>>>>>>>>>>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>>>>>>>>>>>
> >>>>>>>>>>>> are available in the Git repository at:
> >>>>>>>>>>>>
> >>>>>>>>>>>>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>>>>>>>>>>>
> >>>>>>>>>>>> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>>>>>>>>>>>
> >>>>>>>>>>>>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>>>>>>>>>>>
> >>>>>>>>>>>> ----------------------------------------------------------------
> >>>>>>>>>>>> Renjiang Han (1):
> >>>>>>>>>>>>       qcom: venus-5.4: add venus firmware file for qcs615
> >>>>>>>>>>>>
> >>>>>>>>>>>> WHENCE                      |   1 +
> >>>>>>>>>>>
> >>>>>>>>>>> Could you please be more specific, what is the difference between the
> >>>>>>>>>>> existing file and a new file? According to the soc_vers the new file
> >>>>>>>>>>> supports sdm845. Should it instead replace the old firmware?
> >>>>>>>>>> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> >>>>>>>>>> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).
> >>>>>>>>>
> >>>>>>>>> Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
> >>>>>>>>> use v5 signatures?
> >>>>>>>> Infact we started with loading sc7180 firmware on qc615, video init failed. So
> >>>>>>>> far i have seen 2 categories in signing version for video bins, either default
> >>>>>>>> or v6 specific tool.
> >>>>>>>
> >>>>>>> Can firmware / security engineers actually advice us on using v5
> >>>>>>> firmware signatures with QCS615 _and_ with older platforms?
> >>>>>>> Existing venus-5.4/venus.mbn uses v3
> >>>>>>
> >>>>>> Vikash, any updates on this topic? Would it be possible to have a single
> >>>>>> FW image with just v5 signatures?
> >>>>> Not yet Dmitry. Having a followup with relevant folks this friday to understand
> >>>>> the signing requirements across different SOCs, hopefully will be able to add
> >>>>> something on this by then.
> >>>
> >>> It's been more than a week since the last email. Are there any updates?
> >>> I'd really like to get this sorted out before next linux-firmware
> >>> release, otherwise we'll be stuck with these names for the foreseeable
> >>> future.
> >> I have been chasing both the firmware and security folks to align on this. So
> >> far the updates are that one is signed MBNv5 and other with MBNV6, hence leading
> > 
> > I think the existing firmware uses v3, not v5.
> > 
> > 00001000  00 00 00 00 03 00 00 00  00 00 00 00 28 00 a0 0f  |............(...|
> > 
> > 
> >> to different set of binaries. These MBN versions of signing is defined at SOC
> >> level and depends on secure boot libraries used in that SOC.
> >> At the same time, there is an experiment to check if SC7180 can be signed with
> >> version used for QCS615 i.e MBNV6.
> > 
> > Thanks! Are you trying that without updating the whole bootloader stack? I
> > think some of SC7180 devices might be EOL'd, so it might be hard to get
> > FW/bootloader updates.
> Just the firmware part, by signing it with qcs615 way, as an experiment
> suggested by security folks.

Ok, that doesn't sound like a lengthy experiment: resign the FW, boot
the laptop, caboom or not caboom. If I remember correctly the file that
you've pushed even lists sc7180 as allowed.

> 
> >> One query here - given that qcs615 only loads the venus_s6.mbn variant, and it
> >> is not enabled yet (patches in review) for video, we should be good if we
> >> conclude the firmware part before accepting the qcs615 enablement patches ?
> > 
> > Good question. I think that depends on linux-firmware maintainer's
> > opinion.
> > 

-- 
With best wishes
Dmitry
