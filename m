Return-Path: <SRS0=ZqBG=SI=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36CAD637A4
	for <linux-firmware@archiver.kernel.org>; Wed, 13 Nov 2024 17:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A4FCC4CED2; Wed, 13 Nov 2024 17:58:10 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B6F1C4CEC3
	for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 17:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B6F1C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f1292a9bso8776456e87.2
        for <linux-firmware@kernel.org>; Wed, 13 Nov 2024 09:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731520688; x=1732125488; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jBsv2w9X6S1fArmOPqMpGkmqeMeFn4tdx5DBMlyNB1I=;
        b=kSFJ3hziH9pz7/C/14g5Vny/F3XD2Yi6xnysdpp1Cl6skC+8Q384wrs+Aqu5S0ifG1
         l3wgGeU2nD5y6JI0Sh1lLiZoBvx8ggKGkTqLHq+f/MNw97TyW2WEeKD1SMera2i1Zgfj
         ndYmv151GvsLEstRoLF+sWgWrGj1m25kcbKrN4DdNbLZFtRY7YFbo7CZCZfS8wW/ynS/
         K88cAlWR4WxkABAVixOpHL9RQrHOeQvTi2BcLmb9gp7Uwi9/BUMDh8qAGHFYGt9sNDeS
         9jTms8BEIvEKCCP/wSOwbGTg8lIuHIZ1cP2wn+yRt9uJCYtK6Pq9JW20lvhgheGldOtR
         ux/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731520688; x=1732125488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBsv2w9X6S1fArmOPqMpGkmqeMeFn4tdx5DBMlyNB1I=;
        b=LByqMnsor+qrPVgFhLOQz44MuwTsy7cbEzeejiWkz4DUMfo3e8+3UoMxeNUciUHcCU
         6XtlSYTurF40U97GOjQggl+26iDKnhKzIP04jsyi5V/K2iR0xLHePMVWtJdpwjSYFTAz
         s2Ub+wpCDHEM0kwLwdXko9xbVPIpfSwD8CBG3Kh3UHNSpjQnLKV05lpSBRfj3p2XoEPn
         f8KlPHw13Gk3BnAB4ckyKSpNpvm+P4qzaAvCBGc+veZfptpxEIxcdfJicuhvn0djtGUv
         ZE8cSvNDsxk5vbICbl5zIVFCm28eXapL6uR5qvgHc2wSMuHxDO8rM40sdgVxXlP4i+BV
         d5gw==
X-Gm-Message-State: AOJu0YwGvDxVjpuwH98Amj0nIUes2V9PoK/vK1GlAEyyCLZsDmhIMpS/
	o4Nxpxit3pIpMdxP2ew4UOf590X49c6F7RBXSlOMwADoJaSPi7VoIECc41du3oA=
X-Google-Smtp-Source: AGHT+IE6DkE485I/GP+Diw1kdPAbTXpCUlj5ztXS8cTNNdWeh3zL4hE9AUA2CFdhp5yfBocgeh2thA==
X-Received: by 2002:a05:651c:b0f:b0:2fb:61d9:d72b with SMTP id 38308e7fff4ca-2ff20152500mr95963641fa.1.1731520687641;
        Wed, 13 Nov 2024 09:58:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff17991e39sm24492481fa.89.2024.11.13.09.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 09:58:06 -0800 (PST)
Date: Wed, 13 Nov 2024 19:58:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, abickett@quicinc.com
Subject: Re: qcom: Add Audio firmware for X1E80100 CRD/QCPs
Message-ID: <ofnvdx72hgznvenmrwgcqeraszsjrjdc4bfqudj7lpdrsqcwub@5hdfnzbmespa>
References: <7f156ffe-9629-17c1-47c5-97e0d0f3e1e0@quicinc.com>
 <i4ihcid3ka67rhwziue5tblahs6bwaehazq74bd5y64ybs4ahv@l6ti4xqr3yq6>
 <d169bd29-b756-f027-9f33-02106b702359@quicinc.com>
 <a3znmntnj3jliy77qffmiukdwccz75mkg5xj72yw3zxkqmjjsb@geavo66vpbpe>
 <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63fe4338-43dd-e771-45fb-57a2096a1002@quicinc.com>

Hi Sibi,

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

Any updates on the topic?

-- 
With best wishes
Dmitry
