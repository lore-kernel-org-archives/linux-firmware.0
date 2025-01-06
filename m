Return-Path: <SRS0=Qivv=T6=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ADAE77199
	for <linux-firmware@archiver.kernel.org>; Mon,  6 Jan 2025 22:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71BB1C4CEE3; Mon,  6 Jan 2025 22:42:23 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4751AC4CEDD
	for <linux-firmware@kernel.org>; Mon,  6 Jan 2025 22:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4751AC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e3a5fa6aaso17182368e87.0
        for <linux-firmware@kernel.org>; Mon, 06 Jan 2025 14:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736203340; x=1736808140; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m32B3MFzV8QfgXxvWGWTjGxtdW5uIzytf8Ofnwk9RCk=;
        b=M3t/ArR27jjN9ymwkcNm1wnTpDQr3R7ATopWTFH2qA4vEySKoM4gfse5rRwfXYinNq
         RL/L34vzxCuDcRGEDgi4EfLBBFx2fGt9ybmiU5NoHTnOaY8B4EkPd0LshWX02LF3nfl3
         j5+9caOvoeo9VeiUXAaBVvwY1w6iJ1pv4JKBNaffW0NIcS6LJoIbGgXuyK41XD7UJBpg
         ZTJrfuQndxLOqJXyKLV5OsUS1XV/eczohDO7nEGPElVzXONE7q/ajZMuzWxz4dqGkRwh
         GRRo96lpEoNf5RMlfO9JQePsiQD1J2eyRpuHZcJk3k1OivG4Q+d67y48wyrNstU9hXHG
         6Dag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736203340; x=1736808140;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m32B3MFzV8QfgXxvWGWTjGxtdW5uIzytf8Ofnwk9RCk=;
        b=S9yD/S93D/zpSjQvguu7ubwnemabs8mMQhO2J58QjmKEi1JHYCzz9Fy8ZsxyS3Hd+8
         E+8rmSHau3OTX1Xye5X6qbhcH6Wnb6rvZEDHrkkHQS3qFEMNRQJJ44L6Zbi/2SXyunHf
         5nJsvTQcEuEMRWEsrXUtN80lZcszJ0vN0N4kshRm5MCSWLqNKOfzyGz1EkVMF/Onymu1
         UNtq4aYKOI2CFC17+TQXGFW2B+Yy+OAqBYODmGD4KM1jdaIJHWsMujCvWJuZSpYEbAnV
         anc6dEu5L+uA7GCXCsXjTOdlfozN44/KTHgjlBxkdlWp4yyyj7eH7Vd5hc64kftmPCqh
         434w==
X-Gm-Message-State: AOJu0Yxx5ROAvkNXyqXNuK/Ai9aPIGQ5RaZ2rGW6UxsoBB/1TACdG7ok
	atjqB4HtPV4DvnWM0EZPj0aYVViUbfSgT9MNlDgkN5x/tqSMuJds+ZxA5lGpwmg=
X-Gm-Gg: ASbGncsYJy6Eno6tx5G23slis69n7zeoeMSBheDkms+dR0jRqlAcj74jHShht1dsfHK
	5hj9n4H/xY6zuttVYupfH5QXbkX5LLuKiyHRmYNSnH++WkNLXvIb9Gm+cUXoly02LqJ8TeqqGnJ
	zI8B/JMfq9+/R04oVaRsLq/UEKXC99GT97HSz7qEfHDt32gDFiRzlVtGQ/E58ddLhYCx9OGMcMU
	+Qc9R7ETb15B63XcgBEJTEvyFg4oddw+9zM3RkXxcsNLAn/V89dV/789/t1dZrMpiScOLL9gY+I
	z2DYIknM0lTEwKqvYps3sVDY2k61Vf3oQRN7
X-Google-Smtp-Source: AGHT+IEbkXVJHKwFhLaMPR1l1RkygyUq3lr7X0JhNeK9uJhp+YSW8Cbqp1C/zCYh213s66PKW1FG/g==
X-Received: by 2002:a05:6512:3049:b0:541:3175:19b4 with SMTP id 2adb3069b0e04-5427e97b4d7mr233014e87.11.1736203340253;
        Mon, 06 Jan 2025 14:42:20 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542238301adsm5074046e87.246.2025.01.06.14.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 14:42:18 -0800 (PST)
Date: Tue, 7 Jan 2025 00:42:16 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <nxsukcd5vulgyvmlhiej2xswetbvkh2ue6lpamp44bx3vmmccb@42xufw3xwbg4>
References: <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
 <d169bd29-b756-f027-9f33-02106b702359@quicinc.com>
 <a3znmntnj3jliy77qffmiukdwccz75mkg5xj72yw3zxkqmjjsb@geavo66vpbpe>
 <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
 <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
 <e02e6eb7-9af5-87a2-a7f0-248d9c7543c2@quicinc.com>
 <CAA8EJpoagdAXE7L7qG9vQCkJbJ-MnB0LaYtqAoa8yLgj91O9ug@mail.gmail.com>
 <4fb0d093-d00c-13cd-9dba-7393dbcf897c@quicinc.com>
 <nh2uwme4p6ytatr5mindtfryvm524nhdi5hmyvyb6w3qnmeqsc@2umcnv7g6enn>
 <b6979c75-cbc2-6f00-adee-4bb47d8b63cf@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6979c75-cbc2-6f00-adee-4bb47d8b63cf@quicinc.com>

On Mon, Jan 06, 2025 at 05:42:55PM +0530, Sibi Sankar wrote:
> 
> 
> On 12/17/24 16:26, Dmitry Baryshkov wrote:
> > On Tue, Dec 17, 2024 at 03:13:06PM +0530, Sibi Sankar wrote:
> > > 
> > > 
> > > On 12/5/24 16:49, Dmitry Baryshkov wrote:
> > > > On Thu, 5 Dec 2024 at 12:07, Sibi Sankar <quic_sibis@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 11/29/24 20:07, Dmitry Baryshkov wrote:
> > > > > > On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
> > > > > > > 
> > > > > > > 
> > > > > > > On 10/18/24 21:23, Dmitry Baryshkov wrote:
> > > > > > > > On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > On 10/18/24 16:13, Dmitry Baryshkov wrote:
> > > > > > > > > > On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> > > > > > > > > > > 
> > > > > > > > > > > Hello,
> > > > > > > > > > > 
> > > > > > > > > > > The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> > > > > > > > > > > 
> > > > > > > > > > >        Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> > > > > > > > > > > +0000)
> > > > > > > > > > > 
> > > > > > > > > > > are available in the Git repository at:
> > > > > > > > > > > 
> > > > > > > > > > >        https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > > > > > > > adsp-fw-x1e80100-crd
> > > > > > > > > > 
> > > > > > > > > > Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> > > > > > > > > > Windows firmware has it in adspr.jsn.
> > > > > > > > > 
> > > > > > > > > Hey Dmitry,
> > > > > > > > > 
> > > > > > > > > Can you please share what device and META you are comparing this
> > > > > > > > > firmware against? This firmware was taken from the build source
> > > > > > > > > without any modification.
> > > > > > > > 
> > > > > > > > I have been looking at the Windows driver from WSU for the CRD,
> > > > > > > > qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
> > > > > > > > 
> > > > > > > > For the reference, I checked several last drops, they have the following
> > > > > > > > versions of qcadsp8380.mbn:
> > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
> > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
> > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
> > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
> > > > > > > > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
> > > > > > > > 
> > > > > > > > All of them list tms/pdr_enabled in adspr.jsn
> > > > > > > > 
> > > > > > > 
> > > > > > > Thanks for listing them. Already following up internally regarding
> > > > > > > this discrepancy, will push out an update once it gets resolved.
> > > > > > 
> > > > > > Sibi, this has been more than a month ago. Could you please update us on
> > > > > > the pdr_enabled necessity? I'm asking since it's also a part of the
> > > > > > kernel data nowadays.
> > > > > 
> > > > > Hey Dmitry,
> > > > > 
> > > > > Extremely sorry for the delay. I was told this is just a platform
> > > > > specific flag that we can decide to turn on if it handles PDR.
> > > > > Given that linux does handle PDR we can safely turn it on.
> > > > 
> > > > So... is there any reason why it wasn't set previously? Which
> > > > platforms should have it in the enabled state?
> > > 
> > > We had just pushed out the firmware out without modification
> > > but yes like you say it could have been turned on during the
> > > initial push itself since linux supports pdr.
> > 
> > Pushed out where? Also could you please respond to the questions rather
> > than ignoring them?
> 
> All SoCs that has remoterprocs booting pds can have tms/pdc enabled in
> linux since it has pdr support merged. The firmware that I said was
> pushed out was the firmware passed onto me for merge into linux-
> firmware. Sry I thought it was already clear, didn't mean to avoid
> answering any questions.

So, should we enable the pdr_enabled for all those PDs or should we
ignore the flag and drop it from the configurations where it has been
added? The information that you are providing doesn't help me with that
question.


-- 
With best wishes
Dmitry
