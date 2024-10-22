Return-Path: <SRS0=FpIf=RS=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5051CD1CDCA
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Oct 2024 09:48:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26F8DC4CECD; Tue, 22 Oct 2024 09:48:10 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 183EDC4CEE4
	for <linux-firmware@kernel.org>; Tue, 22 Oct 2024 09:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 183EDC4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f72c913aso6268676e87.1
        for <linux-firmware@kernel.org>; Tue, 22 Oct 2024 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729590487; x=1730195287; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmO2ZlpXCq2mLQ+Ns9ETgoeGCPGEuQvYqACuqp75lIk=;
        b=IUlTeO8ThP6siSXJMoIQZ+6E2nr/wrd9H77hiDEIG5VtOIEDY6b6Av7sHBuc79pYfx
         jhA2f9IGHepA7ij9Wlrqs9oIjvDKofLNgWW8w7+3HEhIEHt9EDyVg/qCcACNdWra5/Vv
         OEHbUQU3j9jkKgFI7t4rM3drp13rX/5WS3FWp02Q26rzUhR/qoBkoh7R2cnIBt9VAoUB
         RcO0t5NIdxND3BPZzYTTa+ASw0l6Dco9ouQBOW0y17AEPp7pT5uwlhqLQwU9iDV7ScxN
         oEXwe6nmuHiYkNcwZH0BtSkANfgiacG1mzz9+xEAMAvVy+LKZ+7RY+7qkWD2/qNw8nWc
         Gp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590487; x=1730195287;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmO2ZlpXCq2mLQ+Ns9ETgoeGCPGEuQvYqACuqp75lIk=;
        b=w8l2VdhX1heVvnhXYrPwY+pxiSwI6rDtRWCbJ04tgtvEc/Jkc2a++xIJN/PU2trSHS
         FeHQVUiDC20cFso/pCt/lhnAX4fZw58f6uXG6Y6gUkidh9xcC56fBIqnopx+U1qGeQu5
         qxuXesuTL1oYQcJl7wnzO7KEqzp8DVejj4Tq5nyv4VNDVRnV/sSFbbF1bbj6GpINrxMQ
         uvJc+WDDUjOH20ewQcT7h4bHDyEcyJTQoPjzMcIXJdK9ozxUl+si589//sT6rkVE8X9A
         4EsXZu/mImEJ1ZTiJZTlJpo8he4n2wATLp8VewiJSW4vjQYKe1+hfSXmVxWw9/0wbxJe
         z5HQ==
X-Gm-Message-State: AOJu0YzaEozMNAAsDV/4mwI+zjH2IhSWL7PMVAzOJYMtNCcrTPqtbTwe
	hSgGop1AE6d/3EVCD1QFpgEoLPFz7ahXNU7oYUQFhVQEkAerqd3ml+jkmyNNN+I=
X-Google-Smtp-Source: AGHT+IHNrYnM7EJ8lu0LC8Ea/f+ja+WoPjxtM09OdB3VjEYvb5IrCLDbAASsJldw3Rou0qH++jt4YQ==
X-Received: by 2002:a05:6512:ba4:b0:539:f468:a51c with SMTP id 2adb3069b0e04-53a1546f995mr6919519e87.52.1729590487121;
        Tue, 22 Oct 2024 02:48:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224314ecsm734271e87.206.2024.10.22.02.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:48:06 -0700 (PDT)
Date: Tue, 22 Oct 2024 12:48:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <i72dnzkzjr2sj3twpkmin66e4ksxv5segggt5fz4l5hs2ryev3@liogvub377ri>
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
 <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
 <d169bd29-b756-f027-9f33-02106b702359@quicinc.com>
 <a3znmntnj3jliy77qffmiukdwccz75mkg5xj72yw3zxkqmjjsb@geavo66vpbpe>
 <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>

On Tue, Oct 22, 2024 at 11:49:37AM +0530, Sibi Sankar wrote:
> 
> 
> On 10/18/24 21:23, Dmitry Baryshkov wrote:
> > On Fri, Oct 18, 2024 at 08:58:06PM +0530, Sibi Sankar wrote:
> > > 
> > > 
> > > On 10/18/24 16:13, Dmitry Baryshkov wrote:
> > > > On Fri, Oct 18, 2024 at 12:43:14PM +0530, Sibi Sankar wrote:
> > > > > 
> > > > > Hello,
> > > > > 
> > > > > The following changes since commit 8dbcf94bfc68bdb1c6df3a42762b275557095558:
> > > > > 
> > > > >     Merge branch 'robot/patch-0-1729102102' into 'main' (2024-10-17 15:40:04
> > > > > +0000)
> > > > > 
> > > > > are available in the Git repository at:
> > > > > 
> > > > >     https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> > > > > adsp-fw-x1e80100-crd
> > > > 
> > > > Could you please clarify, why adspr.jsn doesn't declare tms/pdr_enabled?
> > > > Windows firmware has it in adspr.jsn.
> > > 
> > > Hey Dmitry,
> > > 
> > > Can you please share what device and META you are comparing this
> > > firmware against? This firmware was taken from the build source
> > > without any modification.
> > 
> > I have been looking at the Windows driver from WSU for the CRD,
> > qsubsys_ext_adsp8380.cab. DriverVer = 08/27/2024,2.0.4114.4600.
> > 
> > For the reference, I checked several last drops, they have the following
> > versions of qcadsp8380.mbn:
> > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00792-HAMOA-1
> > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00789.1-HAMOA-1
> > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00787.2-HAMOA-1
> > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00784-HAMOA-1
> > QC_IMAGE_VERSION_STRING=ADSP.HT.5.9-00781-HAMOA-1
> > 
> > All of them list tms/pdr_enabled in adspr.jsn
> > 
> 
> Thanks for listing them. Already following up internally regarding
> this discrepancy, will push out an update once it gets resolved.

Thanks!

-- 
With best wishes
Dmitry
