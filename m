Return-Path: <SRS0=2557=TK=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71BEE7717F
	for <linux-firmware@archiver.kernel.org>; Tue, 17 Dec 2024 10:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C85D0C4CEDE; Tue, 17 Dec 2024 10:56:41 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE03DC4CED3
	for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 10:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BE03DC4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-53e3778bffdso5367806e87.0
        for <linux-firmware@kernel.org>; Tue, 17 Dec 2024 02:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734432999; x=1735037799; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qbPl1yOVac9U+Id4sEg6bvpioEa5mX6sKp4jHtdp59E=;
        b=weakfqfpy/iFMwDM9yz0EK54bu2WB/XioWbevnRdpls/DAD+QXFVMC7sBthBlNFjKT
         HYJevzA3zLAsoJyk2Hag1DGAP5eHkyZ/HjzZEqSd7dYKwUQarCaP+4ZMS+YthseKIcTD
         GoFsHo+RhauAtlULkDXrqbNuJV6EADW63V0mGBTQCJyH/6ncbefu0BFFfOMSExz1KLwE
         aDFk7o14TD8PhxuypF0UD+Xy3LDPFMsD4mX/hpG/k02O5cZ86mSC/5a3ERSC03+hpSVS
         SdwCcoMMpkargiQR2z/sgYku4qtcOWI4eLMLfbyLd7Wpe8MZtL120PCc9s+T/+HShMVP
         Oj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734432999; x=1735037799;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbPl1yOVac9U+Id4sEg6bvpioEa5mX6sKp4jHtdp59E=;
        b=TCe6omCli7YPGiuXs9TWKlgTjfGVzWTMTJ02PUBZH4VYQr1rvfOSGYW7y8F8c8vKHs
         pmrqVynTCA1AofVN8aOfG/TghTtxVawUEK39wxAbOMF78fXRKEDDSlDT+3veebRtSvAX
         u+7q6ZLOS7q0rpydfStOmP/+ieOWBQqsvzE1vr7Oo6L1dfAf8ldMYZrmDw4GyHEFfbl6
         +Rapw11SYrbjw+yfDrIDbbu+wGE1J7c3TKsYw97QBdvXyIdrfgYoxpKmsq1iQ4PCMvC8
         RlyQs43G2xghrYCBkBe/UdlKfbT/uONdHh6BBqMk3MxEOUsqMldPAIJvKogDXtnx277n
         r4Lw==
X-Gm-Message-State: AOJu0Yz/O9QqwdUgERZpGQzYJ7sc4f0xfQYSrz0wt5Lu7NrYj3fLbgqf
	fvfoCbGgUR8bi9PHiw1Us0ltJLdtBW6TMElsCPaYdRqBQWyl5lYzRGgDIdMEQLU=
X-Gm-Gg: ASbGncuJM3LNcaAeHqLNY+63Ez3hQGvkEExtnLrx1hroTeFKmiwwOKQNHn5/A0MHbon
	0wnPB6SrvKCvgbL8/rKNNUsMAkboejMV3CsRe5xTmuZKe57ofXf18HoxXffddw8xQs0pjiB1ttj
	W4VDTrddYkoh4RgnRWBJkfwjSHGdb8Bhru8FAS3xAVDDWV1bY460yeMoJxjCbR/VSDxdW6t/pd7
	6qzPFiUAWVh4wp3msi/szN6tHPL9zhPI+8eDW7kODFCDHzu9Le5QuvqzyZbaVDY18XdvgiPLxy1
	cVP7nV5cfkjZjAnrgjTn47szkVxm5Ile8N9R
X-Google-Smtp-Source: AGHT+IHa2y18fnFzhfeI3A2wP5wtp4Z8i5Dj8uVFdGi5FCrgsYUI3gLufszw9Nhr0a/6mvOR8Kqy7w==
X-Received: by 2002:a05:6512:10c7:b0:53e:349c:45c0 with SMTP id 2adb3069b0e04-54099b69dc2mr4459592e87.56.1734432998677;
        Tue, 17 Dec 2024 02:56:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120b9f216sm1110399e87.22.2024.12.17.02.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 02:56:37 -0800 (PST)
Date: Tue, 17 Dec 2024 12:56:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <nh2uwme4p6ytatr5mindtfryvm524nhdi5hmyvyb6w3qnmeqsc@2umcnv7g6enn>
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
 <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
 <d169bd29-b756-f027-9f33-02106b702359@quicinc.com>
 <a3znmntnj3jliy77qffmiukdwccz75mkg5xj72yw3zxkqmjjsb@geavo66vpbpe>
 <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
 <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
 <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com>
 <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
 <4fb0d093-d00c-13cd-9dba-7393dbcf897c@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fb0d093-d00c-13cd-9dba-7393dbcf897c@quicinc.com>

On Tue, Dec 17, 2024 at 03:13:06PM +0530, Sibi Sankar wrote:
> 
> 
> On 12/5/24 16:49, Dmitry Baryshkov wrote:
> > On Thu, 5 Dec 2024 at 12:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 11/29/24 20:07, Dmitry Baryshkov wrote:
> > > > On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
> > > > > 
> > > > > 
> > > > > On 10/18/24 21:23, Dmitry Baryshkov wrote:
> > > > > > On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 10/18/24 16:13, Dmitry Baryshkov wrote:
> > > > > > > > On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> > > > > > > > > 
> > > > > > > > > Hello,
> > > > > > > > > 
> > > > > > > > > The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> > > > > > > > > 
> > > > > > > > >       Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> > > > > > > > > +0000)
> > > > > > > > > 
> > > > > > > > > are available in the Git repository at:
> > > > > > > > > 
> > > > > > > > >       https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > > > > > adsp-fw-x1e80100-crd
> > > > > > > > 
> > > > > > > > Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> > > > > > > > Windows firmware has it in adspr.jsn.
> > > > > > > 
> > > > > > > Hey Dmitry,
> > > > > > > 
> > > > > > > Can you please share what device and META you are comparing this
> > > > > > > firmware against? This firmware was taken from the build source
> > > > > > > without any modification.
> > > > > > 
> > > > > > I have been looking at the Windows driver from WSU for the CRD,
> > > > > > qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
> > > > > > 
> > > > > > For the reference, I checked several last drops, they have the following
> > > > > > versions of qcadsp8380.mbn:
> > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
> > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
> > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
> > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
> > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
> > > > > > 
> > > > > > All of them list tms/pdr_enabled in adspr.jsn
> > > > > > 
> > > > > 
> > > > > Thanks for listing them. Already following up internally regarding
> > > > > this discrepancy, will push out an update once it gets resolved.
> > > > 
> > > > Sibi, this has been more than a month ago. Could you please update us on
> > > > the pdr_enabled necessity? I'm asking since it's also a part of the
> > > > kernel data nowadays.
> > > 
> > > Hey Dmitry,
> > > 
> > > Extremely sorry for the delay. I was told this is just a platform
> > > specific flag that we can decide to turn on if it handles PDR.
> > > Given that linux does handle PDR we can safely turn it on.
> > 
> > So... is there any reason why it wasn't set previously? Which
> > platforms should have it in the enabled state?
> 
> We had just pushed out the firmware out without modification
> but yes like you say it could have been turned on during the
> initial push itself since linux supports pdr.

Pushed out where? Also could you please respond to the questions rather
than ignoring them?

-- 
With best wishes
Dmitry
