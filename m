Return-Path: <SRS0=yZ4q=RO=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDBDD2FFFA
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Oct 2024 15:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B55C0C4CEC5; Fri, 18 Oct 2024 15:53:25 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 680CEC4CEC3
	for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 15:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 680CEC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e3f35268so183251e87.3
        for <linux-firmware@kernel.org>; Fri, 18 Oct 2024 08:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729266802; x=1729871602; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LdfM9i00wvLElz7iehik+sKKNr66LSFXicebDz02HwQ=;
        b=EAkRZW9rWLiQdu7q8r61vp4SO70YzjohFrGqlyMLimN+lfbK+k4+vr2Z6xWBLh92Hd
         1NWWkeRSHUWzjPXG77umG5BmziOm2WrQfbhG7EUL1vNtlE79JbkfTfstMCHS1IUF5B0+
         v5FGp7GPpuqZzvWe0lu9pDl51CYgwR2Nh5ITg+T+TI2a5Zgn7hTh3ZBhgJgb6JoRtBCX
         Af5nMkbDWWcYc+3MLR5JEGKrUCMKVUnTCbJTh537QbhCJztNPntj3zWPQuCSsNJJVWYP
         BhzVUoZzgqF3jdWm7I1vBEWw8tFGM8eyk/lTwFeov4nfkKSXdAZhHEgljXZ1Myj8WNE9
         AoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729266802; x=1729871602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdfM9i00wvLElz7iehik+sKKNr66LSFXicebDz02HwQ=;
        b=jQweKoMKXx2Gu+zL5LJg4OQcD83HMDuIJ4jkN2hHoLdzdDduL/7YAztSutWbxQh824
         N8hxlaEFEyxp3HIU2WUplNBpdgN5NSpod3LCakt+8zZaUfzdfFbWTOVAxmvo/PNf2Yr4
         uzWqpqtvM1RipS0/XZvckqsYF/lWc9KV02vQPbsLUs4JVz/Tvzpz4gqQF5zlps3D2zWR
         TjaZkEghvxRkcX3ihr245INdZHLdpfijkwT8flI5EFLAxephK9rMUxvFJSz1UsCtGpCc
         jfQo4ly+Y24JlJyyHp/esnokdw4sKc0Oq6gKwfg80q1qu/P0988xo3iuNJS/p5VaJ5aS
         oLcQ==
X-Gm-Message-State: AOJu0YyCidKdOSzY3GxlNsOjDTFFUEGOvr1mRd/6wG/4coFcKlRKyNNp
	Bw/d2WgqzImvc8uO3dK/6WnKQkyx0w5vDBJGhoE4KEWWAs8yFyqr39OYLUqGYzo=
X-Google-Smtp-Source: AGHT+IEX0HSv/e78Z2/Wa3mwdUldhRxgePKlg/ZPtTpzw1a128uFb2Vz7AZau+yXaca52m7adxuTjg==
X-Received: by 2002:a05:6512:2244:b0:539:e282:ce9e with SMTP id 2adb3069b0e04-53a154acb0bmr1630301e87.60.1729266802314;
        Fri, 18 Oct 2024 08:53:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211bbcsm252045e87.284.2024.10.18.08.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 08:53:21 -0700 (PDT)
Date: Fri, 18 Oct 2024 18:53:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <a3znmntnj3jliy77qffmiukdwccz75mkg5xj72yw3zxkqmjjsb@geavo66vpbpe>
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
 <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
 <d169bd29-b756-f027-9f33-02106b702359@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d169bd29-b756-f027-9f33-02106b702359@quicinc.com>

On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
> 
> 
> On 10/18/24 16:13, Dmitry Baryshkov wrote:
> > On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> > > 
> > > Hello,
> > > 
> > > The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> > > 
> > >    Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> > > +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > adsp-fw-x1e80100-crd
> > 
> > Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> > Windows firmware has it in adspr.jsn.
> 
> Hey Dmitry,
> 
> Can you please share what device and META you are comparing this
> firmware against? This firmware was taken from the build source
> without any modification.

I have been looking at the Windows driver from WSU for the CRD,
qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.

For the reference, I checked several last drops, they have the following
versions of qcadsp8380.mbn:
QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1

All of them list tms/pdr_enabled in adspr.jsn

> 
> -Sibi

-- 
With best wishes
Dmitry
