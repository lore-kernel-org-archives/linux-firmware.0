Return-Path: <SRS0=038F=SY=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5989BD6EC15
	for <linux-firmware@archiver.kernel.org>; Fri, 29 Nov 2024 14:37:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 435B7C4CED2; Fri, 29 Nov 2024 14:37:39 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 41959C4CECF
	for <linux-firmware@kernel.org>; Fri, 29 Nov 2024 14:37:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 41959C4CECF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffe2700e91so16094121fa.2
        for <linux-firmware@kernel.org>; Fri, 29 Nov 2024 06:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732891056; x=1733495856; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f/gxLi4bsmDXe0JrwV6qoZoUM5hs6wXzt39XDXDOdes=;
        b=zz6enOE+pcD7cyPpDXi4E2lSACJ2ov3kp7M25ZzAn6r4qgfZ7UINpxR3zVz+G7qvVG
         PSRiv9pgzd1mHGHlTyLqFYDMNUE2g25QuGg+YDthNNglbCCajQbZU8lXqsmhdbXeNoIv
         kyYe2N+9yH8QQPNHMWmj7rrhRlCuAq5C3jE5swFioYokGIVmlQeERk/Z0qTl1kNrrW0S
         GhWYSFs7ocqNGBWtjeGEQ1klM+uZ1coVJgDOBaykRmNuG4hq0otV9OeZqCbiYtq5D9FO
         lvzM4AqINVAYlm93KRU4CEx7UZZdbPH9o2gGH2QDoKLYe6s/xOQKTQ5wFM3AaaRQg2yE
         Oyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732891056; x=1733495856;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/gxLi4bsmDXe0JrwV6qoZoUM5hs6wXzt39XDXDOdes=;
        b=I0go5+KYde+6YCM2qYlffkwN9b2LevD5+sqKPhknORm0GW8AL/wxUP9xVq99B7NSr+
         PSh0r+lG3LZSXrkI+lUrVcW0yekOT8MDD4Qxw96Bm9RO2GgjFwink+nlYh54UlBkfLsz
         6X7fqHhshk1u71dwTymoTwrSebLza8MyriwLdGd/KEbg8Vc4QezLeLjBJwCy8dWNZ0Ex
         /FtQV+TsMu2zRAIfLUUQM+KLgOcGlS8yqLArCQ4RUy99kSUWr2xFdVy3Q/izxmJzGb7y
         lgMyfFpymQiiWXDXM5XEYfQgOMrCncDV+R6E+3WmhECinx2OZgOeh9zrxzHfgzj48mGI
         jbog==
X-Gm-Message-State: AOJu0Yy35ScDYKFDzaY3qKx4w3qnvJPqaU+YxjmTXlxhLNEfWqqStYj2
	pEa7jneg6m1hxKlel+HYiur0lFv6zFxD+mKdhNgj4e1gan/hoOoTMek89AARiUU=
X-Gm-Gg: ASbGncswCxjVL67pVAqFX3UQiPGPMV4tfGQyTzCNceARfOr4uI/xNOA4Fyk6rcOon00
	Gelhst679r3MmIYjhCUuPiVJsmCJh0qdqVY2csq1ZDQ1g/L1GWsf6NCVQAq8StktU1V2y9T9YMT
	dP174hJpCjFslAJNrqO6zgWuCthi39dERCYyIlFO2oQFPuymggkMLiRaXyjOZ5LShDJf0T3OlNS
	eOq2BHnfwkgRu0qiHUytdzSQYot9UREOQpGiEBgDEC0ZWqbknz9FaPFmfIbntk4JYoQwgPTlkOb
	GkcxnWI4r5CG2hkuf873bbdRXmCZJg==
X-Google-Smtp-Source: AGHT+IFHrxMz++EaB2cJV/5vb/RXaBaaAc9nCKxBILhJ1eZFyL7AwXMvvN9HnccTTsTMoIt0mH42+Q==
X-Received: by 2002:ac2:55b9:0:b0:53d:f4d7:eec6 with SMTP id 2adb3069b0e04-53df4d7effamr4466482e87.38.1732891056143;
        Fri, 29 Nov 2024 06:37:36 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6431035sm503283e87.26.2024.11.29.06.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 06:37:35 -0800 (PST)
Date: Fri, 29 Nov 2024 16:37:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <cz6nu7fuf23poqahslmnqisuiqakjzkmwvk2znvohmjrnvgfhs@wb4wkugrkgfm>
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

Sibi, this has been more than a month ago. Could you please update us on
the pdr_enabled necessity? I'm asking since it's also a part of the
kernel data nowadays.

-- 
With best wishes
Dmitry
