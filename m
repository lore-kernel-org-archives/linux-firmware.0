Return-Path: <SRS0=JQRr=VZ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B20C282D1
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Mar 2025 06:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3031C4CEEA; Thu,  6 Mar 2025 06:43:01 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3EA3C4CEE5
	for <linux-firmware@kernel.org>; Thu,  6 Mar 2025 06:43:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3EA3C4CEE5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54964f8ce4bso328370e87.2
        for <linux-firmware@kernel.org>; Wed, 05 Mar 2025 22:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741243379; x=1741848179; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LUm0GG5QjIXe1UAZyAqr/rmW2clAMNK97tvKQM0r6jk=;
        b=G0AAt/x1CvjS1DOnKJ9CYM9h7Jr9NMi+r0/tSaAlpHYgbP5RKE8XgzsD/dziMjPfLS
         8B2BkABYFpctYuqnFEPSVxp+9koJmo4idd9UasC0sI8NPv7EUqy6Iu/TIPdlL/MFMxIy
         +CEMTED9Z//fgKvHU9hOtcHBVjJcQ+scBQ41mt2PM5Bo0I7RAXS3CFPjgjJDo1ZmFNQe
         y0P8GvJLJt5QmVTHqBwxmc1Wp1m8+5T95TTWbE/FjHsbUItWt2rYSLkNemXiqB36Ww1N
         25VjwnWdTE+Bzy314/kV4wIb5padj9aLaJgLvAK1wbiclXdDGKIA121OIw8ddiPATzrw
         iGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741243379; x=1741848179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUm0GG5QjIXe1UAZyAqr/rmW2clAMNK97tvKQM0r6jk=;
        b=xJARV6jWX7zQurQp7F3AWYlYgy3t9KHax367iJKDaxscYOl2/3pgc91lq01gJbb560
         PvN1jToI8MyWVN5mAp1/7LyVh0p6Mpmdys5Fy8mfLWiPSnd3icoHpsa21J0fe8poUmIk
         2zyE5iEF8xMC/oODY4WdVF3Bx+eUerQ8bYaWr2BIZ5869OfIurw37xR2u2HBGah2QuWH
         avc6gglXwwUS53jQ2IzpAfdWDXtZODP48HACReS2mmqFMyjG9IcoExFmPCOmHvPKb/HN
         viTVDy8cToQ/6rkQxIl1j505b7S9mf8Ti+0nei8KwsmN/dzel8xhbV/XXgtBfcD4N5cd
         ICzw==
X-Gm-Message-State: AOJu0YzXAy8iZzcV348I3g2Mw0IgJjljuQPG+biicFzdvFIDiHC2WMHv
	KGP8ZXqXIiAqPEgE7Mphnlcm4MJFc7tGBpJZMjdhOyxJC6OcmR9Ydk3jJRodSlg=
X-Gm-Gg: ASbGnctYnEkRSZGdqbRX217efKc9U5PZKBpm+fZESQa+rz1hF7E0ApjhJC4zBRxz49w
	Uula+LFTJOtj7JR2PNFQY9hur5JoZNRv9MOlKdVzr/aj9DmmDQ1J9yA4OQZEMwZPcfydac022Ws
	YwF4utqy8grJBBukdV3ajusltLjo6XCu/bXuefuP5F9Qxxmn9Gp5OMBg4yBJfxBCEr4UrBd0QXF
	rbdo+y0+sl7VJWyE2pds85noJaM2denMXrk3PYJZNXQIb1gLdXSBOKwSbjeLPg5ecKh9MRqnpng
	/vdz3/LpSj/nzCYSTII358RTBitV0Y9tK/wdRWeS+WeEqyiGJWK7eBwGT8Pa8BY2CQS/habV2Vb
	ECdpw9rjoxc/p+rJ5VGXcI/Su
X-Google-Smtp-Source: AGHT+IHyqK7mSJveAprSOlFxmY1RDKSiJaTD6C54BNbdNbMPfCLnImwIUeCL8Tpsp0p5LS5mi5K/cw==
X-Received: by 2002:a05:6512:39c7:b0:545:3034:7b8 with SMTP id 2adb3069b0e04-5497d34cc87mr2092421e87.23.1741243377192;
        Wed, 05 Mar 2025 22:42:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae580c5sm82049e87.70.2025.03.05.22.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:42:55 -0800 (PST)
Date: Thu, 6 Mar 2025 08:42:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL v2] QCA: Add and update Bluetooth firmwares for
 WCN685x and QCA2066
Message-ID: <jdhvuzryhd5ut4gzjv4s526gehbkjjvv573d45rhbosrcayf5e@nk34n5sb6xgu>
References: <2085b56d-318b-439f-832f-a31113dd07f5@quicinc.com>
 <2t5btpic6wgehpaww2oahr2ngtsyu62mvacfc5726u4kz4s42a@ti4hj2shd6lt>
 <83952440-70ce-4dfd-9991-bfb8b37683e0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83952440-70ce-4dfd-9991-bfb8b37683e0@quicinc.com>

On Thu, Mar 06, 2025 at 01:35:43PM +0800, Zijun Hu wrote:
> On 3/6/2025 1:10 PM, Dmitry Baryshkov wrote:
> >>   https://github.com/zijun-hu/qca_btfw qca_btfw_0305-1
> >>
> >> for you to fetch changes up to b011c42ad704a6fe03c38793972e9b48057ed1aa:
> >>
> >>   QCA: Add Bluetooth firmwares for QCA2066 with USB transport
> >> (2025-03-06 11:15:39 +0800)
> > Version: tag should come before the relevant File: tags. Could you
> 
> i find that WHENCE have below both styles currently.
> A)
> File: file_1
> File: file_2
> Version: version_1_2
> 
> B)
> Version: version_1_2
> File: file_1
> File: file_2
> 
> Are there any formal link or Docs about which one is better or have
> description about file and version?

Most of the entries use the option A

> 
> > please fix the order of fields in the WHENCE file?
> that may be another topic, may need a dedicated thread and patch to fix it.

I meant, in your patches, of course.

-- 
With best wishes
Dmitry
