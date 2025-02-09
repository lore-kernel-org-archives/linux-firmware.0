Return-Path: <SRS0=RO/i=VA=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33988C02199
	for <linux-firmware@archiver.kernel.org>; Sun,  9 Feb 2025 13:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7CB9C4CEE2; Sun,  9 Feb 2025 13:47:41 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E02AC4CEDD
	for <linux-firmware@kernel.org>; Sun,  9 Feb 2025 13:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E02AC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-543d8badc30so3952635e87.0
        for <linux-firmware@kernel.org>; Sun, 09 Feb 2025 05:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739108859; x=1739713659; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny0MVAcvghpYY3uH7Pcx+7lHaV00NJpLGgrB84BuTjk=;
        b=dDusj8u7crvTExGSwL9zoOCy3eGnhYA9gQs/rSK0sEhmiRQ2DUcDFgXrVCsIxMfjIo
         PcYUJbDibWNDN/1/jyKwn6w32ENayr/RwVc+v6QB7DLSjwu5nQf2m2OyFjjzLEqkOsWX
         EGUcg5WQ18d1t+O913cDnCMq5137ICpYOmMpwa1Uc6eVGPFJsOqVVGMqmIyCFMoAwqI8
         eXKfzNUKzIhPNOqZXZB3VWgU62N77P4iA42B17VsukmLIasgR1mvHiT/AWC0bZx5Ev19
         H/3onLttIk8Epx2eSmTMyf74TSNWZK/Bxt3poFMYZJUt4Ntfyunnkp0EtD7xOYIdjaJ1
         GVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739108859; x=1739713659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny0MVAcvghpYY3uH7Pcx+7lHaV00NJpLGgrB84BuTjk=;
        b=gnMU3Nq5qoCj6p+bSIekKyFY2PLcfU9NIbu8XVxDfjy/0IY/GSRhpqFEYVa5VX/a98
         uv2lK6OMzF9zW6fLtSNhFOnvhvB7Pr3OF1hvzXjio+N9o4ej8my3Msm5WwMiGNYbV2ly
         DYI5CN/sApSkNF93vogm1lCreI0m5/bi+aWK75jsJsiR1twtsj1JC5b/4XHCNcmYpB/I
         xZWMW0nwi/x0IWHmtz9Mv/Dpe2QJItFRB+040VP6mYH86hhE/iecgwYUubSdAdb1AcEA
         4OfMrYwXF6XsN9dU+lgBHcj3I8j+OG05lDcomNWQJR4h1vWWXWJ55ueHfdVNiwyu0dp8
         +/bg==
X-Gm-Message-State: AOJu0Yw3hf1q3Yv71jDu/Qo/ZChsBTLD23BI5Ep3Y2oBAH3aFLY16RnW
	ZfSBn0rWgRKBTUUqHYW7+iopBEczIxc3DEKYXJAka9gaBLCs+pr5Fzdcl6OE11U=
X-Gm-Gg: ASbGncsiYGGO7xxPCcyfnapNviQAG6wOBv0C0VYQwrIGpFNzvBiiTjklohJQPJit8pH
	T2vBYNuUsqg6GxNosIDVCZz+X9/LHcT+GUfwxAKdT/TynIi425Skl5pDnUI5fFuVbk+DpqHzbA0
	x3FtIBQIHWh56XfCYalMojSEL73uJTPhTi9zBTUTm6XY2V4zwMQHzLTXCZ58H2z4a+jJKw3c+jP
	oKX+cpCaqL2jyNahxBBsHenx/uUO+EJSy+6qdHD83ztOnl7d76IFv6Yx29EARWZMiEtpLDfHKwI
	lQm4vtEK515aSMTVOFSLD+/tefkI26pB9NfwT6ZFLtajJlnwrzhCxkXJq5B41MWR87Cii1A=
X-Google-Smtp-Source: AGHT+IHg0EykMC7na9ArJVkyvbBBXp6wabegqbL+4rNfzMIIHNDsCkDCwufyUc4k0hOHheBnoNybVQ==
X-Received: by 2002:a05:6512:3dac:b0:542:28b4:2732 with SMTP id 2adb3069b0e04-54414ab5119mr3493482e87.19.1739108858535;
        Sun, 09 Feb 2025 05:47:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545066d6939sm369502e87.155.2025.02.09.05.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 05:47:37 -0800 (PST)
Date: Sun, 9 Feb 2025 15:47:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <dtu6f4nnutcufgu4n2rbbwvyywsl4sqarfstqrbl6i25kjlnvl@w33shxkpqtze>
References: <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
 <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
 <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com>
 <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
 <4fb0d093-d00c-13cd-9dba-7393dbcf897c@quicinc.com>
 <nh2uwme4p6ytatr5mindtfryvm524nhdi5hmyvyb6w3qnmeqsc@2umcnv7g6enn>
 <b6979c75-cbc2-6f00-adee-4bb47d8b63cf@quicinc.com>
 <nxsukcd5vulgyvmlhiej2xswetbvkh2ue6lpamp44bx3vmmccb@42xufw3xwbg4>
 <20bf354a-aac9-514a-aa8a-f313e569a4cd@quicinc.com>
 <plfoqdkuuczjvnz2wcd4ewfgahtabztmfgehpnhvpdpbyrlkjn@esr2cieq62be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <plfoqdkuuczjvnz2wcd4ewfgahtabztmfgehpnhvpdpbyrlkjn@esr2cieq62be>

On Wed, Jan 08, 2025 at 01:56:37PM +0200, Dmitry Baryshkov wrote:
> On Wed, Jan 08, 2025 at 10:19:29AM +0530, Sibi Sankar wrote:
> > 
> > 
> > On 1/7/25 04:12, Dmitry Baryshkov wrote:
> > > On Mon, Jan 06, 2025 at 05:42:55PM +0530, Sibi Sankar wrote:
> > > > 
> > > > 
> > > > On 12/17/24 16:26, Dmitry Baryshkov wrote:
> > > > > On Tue, Dec 17, 2024 at 03:13:06PM +0530, Sibi Sankar wrote:
> > > > > > 
> > > > > > 
> > > > > > On 12/5/24 16:49, Dmitry Baryshkov wrote:
> > > > > > > On Thu, 5 Dec 2024 at 12:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 11/29/24 20:07, Dmitry Baryshkov wrote:
> > > > > > > > > On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
> > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > On 10/18/24 21:23, Dmitry Baryshkov wrote:
> > > > > > > > > > > On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
> > > > > > > > > > > > 
> > > > > > > > > > > > 
> > > > > > > > > > > > On 10/18/24 16:13, Dmitry Baryshkov wrote:
> > > > > > > > > > > > > On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > Hello,
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > >         Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> > > > > > > > > > > > > > +0000)
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > > are available in the Git repository at:
> > > > > > > > > > > > > > 
> > > > > > > > > > > > > >         https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > > > > > > > > > > adsp-fw-x1e80100-crd
> > > > > > > > > > > > > 
> > > > > > > > > > > > > Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> > > > > > > > > > > > > Windows firmware has it in adspr.jsn.
> > > > > > > > > > > > 
> > > > > > > > > > > > Hey Dmitry,
> > > > > > > > > > > > 
> > > > > > > > > > > > Can you please share what device and META you are comparing this
> > > > > > > > > > > > firmware against? This firmware was taken from the build source
> > > > > > > > > > > > without any modification.
> > > > > > > > > > > 
> > > > > > > > > > > I have been looking at the Windows driver from WSU for the CRD,
> > > > > > > > > > > qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
> > > > > > > > > > > 
> > > > > > > > > > > For the reference, I checked several last drops, they have the following
> > > > > > > > > > > versions of qcadsp8380.mbn:
> > > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
> > > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
> > > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
> > > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
> > > > > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
> > > > > > > > > > > 
> > > > > > > > > > > All of them list tms/pdr_enabled in adspr.jsn
> > > > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > Thanks for listing them. Already following up internally regarding
> > > > > > > > > > this discrepancy, will push out an update once it gets resolved.
> > > > > > > > > 
> > > > > > > > > Sibi, this has been more than a month ago. Could you please update us on
> > > > > > > > > the pdr_enabled necessity? I'm asking since it's also a part of the
> > > > > > > > > kernel data nowadays.
> > > > > > > > 
> > > > > > > > Hey Dmitry,
> > > > > > > > 
> > > > > > > > Extremely sorry for the delay. I was told this is just a platform
> > > > > > > > specific flag that we can decide to turn on if it handles PDR.
> > > > > > > > Given that linux does handle PDR we can safely turn it on.
> > > > > > > 
> > > > > > > So... is there any reason why it wasn't set previously? Which
> > > > > > > platforms should have it in the enabled state?
> > > > > > 
> > > > > > We had just pushed out the firmware out without modification
> > > > > > but yes like you say it could have been turned on during the
> > > > > > initial push itself since linux supports pdr.
> > > > > 
> > > > > Pushed out where? Also could you please respond to the questions rather
> > > > > than ignoring them?
> > > > 
> > > > All SoCs that has remoterprocs booting pds can have tms/pdc enabled in
> > > > linux since it has pdr support merged. The firmware that I said was
> > > > pushed out was the firmware passed onto me for merge into linux-
> > > > firmware. Sry I thought it was already clear, didn't mean to avoid
> > > > answering any questions.
> > > 
> > > So, should we enable the pdr_enabled for all those PDs or should we
> > > ignore the flag and drop it from the configurations where it has been
> > > added? The information that you are providing doesn't help me with that
> > > question.
> > 
> > Yes, we should list tms/pdr as enabled because without that I was told
> > the entire Q6 would go down instead of just the pd i.e. without that
> > the Q6 assumes that the platform doesn't support pd restart and tears
> > down everything including the root.
> 
> Starting from which platform? Should it be enabled for msm8996?

Sibi, we haven't heard from you for a month. Should pdr_enabled be set
for all platforms and all domains?

-- 
With best wishes
Dmitry
