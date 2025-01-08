Return-Path: <SRS0=bTe5=UA=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341D5E77199
	for <linux-firmware@archiver.kernel.org>; Wed,  8 Jan 2025 11:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE3EDC4CEDD; Wed,  8 Jan 2025 11:56:46 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9DD6C4CEE4
	for <linux-firmware@kernel.org>; Wed,  8 Jan 2025 11:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9DD6C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso348198e87.0
        for <linux-firmware@kernel.org>; Wed, 08 Jan 2025 03:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736337401; x=1736942201; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4FLEocodkN86sdkcxixVNGpfnTNAf61dVGnmo5tr2X0=;
        b=SPKa/I1YMb5y4RQRljsPJPxc++zP8E4Q0kfVJ7q+CLRMs7WKNQ/dDObydBTxazBwPk
         hO1mnS3FEtxtelP7ejZdOMlY29iuWfz+yQHH19+DmlGr+Rp56dA/31PrmGjd8xFZrPU1
         gvx8AASNljmj6Q8QqbGEEjfpeDnN/FETIHBHeZ3db7Xx7d3mfyd3yutWmZpknvQX+R/Q
         qoW5JYFC1zWBlVS+i9eksYayKQiuZT9kpKoWe36xdDpIfHzRMwz2BU1dSuLx9LmeRN9l
         xSQrogRAqDlYwtgfzbmrka3BMly1atlgeUJj07ZTX/nGmslagn5uqfGI5cqIIlYz0icD
         jBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736337401; x=1736942201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FLEocodkN86sdkcxixVNGpfnTNAf61dVGnmo5tr2X0=;
        b=aIR5+B1zaVW0JSaDOHzJVQKz+gFEkrIQFnpYLH5f/N8A5i65faGnMyGTpCAjKatVMG
         Jh0IHA7YIiZSlXzHpRcCKhgQxmt0Hq0DIYozbvi1jP6VJ5LJ4UY4F1xjx5+Vmn9vpwKx
         d93rLHK9eC2xrw14x2PImMdBRh0AMdGR+4aeqUQ4n/R0ouwQ5Jvk7YmILv5uqxSvgeC9
         RaqiTTbsSO28HmvDcHRl+FiiuqrHBfetnMPgkdMiFU9uPvLNax+ynGmfo75pWJCVhjY8
         QJysLiqMKQiGrVvjmOeWaohWZDiMgBuvtROQQeYCkdLQv3XUg5bTTnWvjjpoiaxe1VJm
         NEjQ==
X-Gm-Message-State: AOJu0Yz10xFPG0vtBm8D6sZFpsF+BqIuosmeQvbvFkUDNDBy+jyilbMI
	TMG5cUd32VirW9RABfyo5PwNOxrEFeSvcpwrZ0TTl4zxAnpCniltzt4UvCi+Pic=
X-Gm-Gg: ASbGncu6SwS4VlwFRTmAJWAg1KxQeySsLu5eMGa6Paxb2ukkjanNhZ1OhXFj5zSVUFL
	rdGjV4UaaoKkcOAHRxxnrOYMoKwHWqLwzhXPUlbm988AHBfLElarrk7x81xEevTJx1VtDJLa0T5
	dBPKPWWbI2ubzVNNYODr0u0/TU5ncLA1ihU0ThTnd3Jjrt6bzERsb2k7SU24bdOwEP4k8ptyO+e
	8TUe/Vc99tll72pnO5LREqW6gaif4I7HDSGseFb43Or+xF3XZY4Stc0wvquhXuEN+bw/ce1oYMt
	gqEhRHTI8olMd+MmWl26hEtq4RzIkZxO1Iqa
X-Google-Smtp-Source: AGHT+IEHgbDE6XSaYuzC/2xv+Wh1+0Dafs2OCkiqH4lD8iD4rVPUeR9imtfoRCbdGncVUMGIY0EaRg==
X-Received: by 2002:a05:6512:3049:b0:541:3175:19b4 with SMTP id 2adb3069b0e04-5427e97b4d7mr2065296e87.11.1736337401542;
        Wed, 08 Jan 2025 03:56:41 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223821578sm5397851e87.192.2025.01.08.03.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 03:56:40 -0800 (PST)
Date: Wed, 8 Jan 2025 13:56:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <plfoqdkuuczjvnz2wcd4ewfgahtabztmfgehpnhvpdpbyrlkjn@esr2cieq62be>
References: <a3znmntnj3jliy77qffmiukdwccz75mkg5xj72yw3zxkqmjjsb@geavo66vpbpe>
 <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
 <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
 <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com>
 <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
 <4fb0d093-d00c-13cd-9dba-7393dbcf897c@quicinc.com>
 <nh2uwme4p6ytatr5mindtfryvm524nhdi5hmyvyb6w3qnmeqsc@2umcnv7g6enn>
 <b6979c75-cbc2-6f00-adee-4bb47d8b63cf@quicinc.com>
 <nxsukcd5vulgyvmlhiej2xswetbvkh2ue6lpamp44bx3vmmccb@42xufw3xwbg4>
 <20bf354a-aac9-514a-aa8a-f313e569a4cd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20bf354a-aac9-514a-aa8a-f313e569a4cd@quicinc.com>

On Wed, Jan 08, 2025 at 10:19:29AM +0530, Sibi Sankar wrote:
> 
> 
> On 1/7/25 04:12, Dmitry Baryshkov wrote:
> > On Mon, Jan 06, 2025 at 05:42:55PM +0530, Sibi Sankar wrote:
> > > 
> > > 
> > > On 12/17/24 16:26, Dmitry Baryshkov wrote:
> > > > On Tue, Dec 17, 2024 at 03:13:06PM +0530, Sibi Sankar wrote:
> > > > > 
> > > > > 
> > > > > On 12/5/24 16:49, Dmitry Baryshkov wrote:
> > > > > > On Thu, 5 Dec 2024 at 12:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > On 11/29/24 20:07, Dmitry Baryshkov wrote:
> > > > > > > > On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 10/18/24 21:23, Dmitry Baryshkov wrote:
> > > > > > > > > > On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > On 10/18/24 16:13, Dmitry Baryshkov wrote:
> > > > > > > > > > > > On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Hello,
> > > > > > > > > > > > > 
> > > > > > > > > > > > > The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> > > > > > > > > > > > > 
> > > > > > > > > > > > >         Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> > > > > > > > > > > > > +0000)
> > > > > > > > > > > > > 
> > > > > > > > > > > > > are available in the Git repository at:
> > > > > > > > > > > > > 
> > > > > > > > > > > > >         https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > > > > > > > > > adsp-fw-x1e80100-crd
> > > > > > > > > > > > 
> > > > > > > > > > > > Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> > > > > > > > > > > > Windows firmware has it in adspr.jsn.
> > > > > > > > > > > 
> > > > > > > > > > > Hey Dmitry,
> > > > > > > > > > > 
> > > > > > > > > > > Can you please share what device and META you are comparing this
> > > > > > > > > > > firmware against? This firmware was taken from the build source
> > > > > > > > > > > without any modification.
> > > > > > > > > > 
> > > > > > > > > > I have been looking at the Windows driver from WSU for the CRD,
> > > > > > > > > > qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
> > > > > > > > > > 
> > > > > > > > > > For the reference, I checked several last drops, they have the following
> > > > > > > > > > versions of qcadsp8380.mbn:
> > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
> > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
> > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
> > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
> > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
> > > > > > > > > > 
> > > > > > > > > > All of them list tms/pdr_enabled in adspr.jsn
> > > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Thanks for listing them. Already following up internally regarding
> > > > > > > > > this discrepancy, will push out an update once it gets resolved.
> > > > > > > > 
> > > > > > > > Sibi, this has been more than a month ago. Could you please update us on
> > > > > > > > the pdr_enabled necessity? I'm asking since it's also a part of the
> > > > > > > > kernel data nowadays.
> > > > > > > 
> > > > > > > Hey Dmitry,
> > > > > > > 
> > > > > > > Extremely sorry for the delay. I was told this is just a platform
> > > > > > > specific flag that we can decide to turn on if it handles PDR.
> > > > > > > Given that linux does handle PDR we can safely turn it on.
> > > > > > 
> > > > > > So... is there any reason why it wasn't set previously? Which
> > > > > > platforms should have it in the enabled state?
> > > > > 
> > > > > We had just pushed out the firmware out without modification
> > > > > but yes like you say it could have been turned on during the
> > > > > initial push itself since linux supports pdr.
> > > > 
> > > > Pushed out where? Also could you please respond to the questions rather
> > > > than ignoring them?
> > > 
> > > All SoCs that has remoterprocs booting pds can have tms/pdc enabled in
> > > linux since it has pdr support merged. The firmware that I said was
> > > pushed out was the firmware passed onto me for merge into linux-
> > > firmware. Sry I thought it was already clear, didn't mean to avoid
> > > answering any questions.
> > 
> > So, should we enable the pdr_enabled for all those PDs or should we
> > ignore the flag and drop it from the configurations where it has been
> > added? The information that you are providing doesn't help me with that
> > question.
> 
> Yes, we should list tms/pdr as enabled because without that I was told
> the entire Q6 would go down instead of just the pd i.e. without that
> the Q6 assumes that the platform doesn't support pd restart and tears
> down everything including the root.

Starting from which platform? Should it be enabled for msm8996?

-- 
With best wishes
Dmitry
