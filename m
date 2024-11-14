Return-Path: <SRS0=YLXH=SJ=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A103DD65C6F
	for <linux-firmware@archiver.kernel.org>; Thu, 14 Nov 2024 10:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B7E3C4CECF; Thu, 14 Nov 2024 10:47:06 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66E7FC4CECD
	for <linux-firmware@kernel.org>; Thu, 14 Nov 2024 10:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66E7FC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53da2140769so451120e87.3
        for <linux-firmware@kernel.org>; Thu, 14 Nov 2024 02:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731581223; x=1732186023; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWlZMUn+5t9YCrCLhpFcRSUmdWYZjdBQdfe9Ax62IJQ=;
        b=dV2phrVj9azQ56EF+khl74kuhcFSZKgNiukfhk7cW9eti0D+ufdfJKqjAVzWkQdY9u
         ao5nCFrYbQD5Lb5+O/0Ra5UFaSFr1TJPLrSCfZxJof/ZbZJMp16fRQLdJtnrEOBC0I4P
         Q3ihuZgRaLtIgLsHzH9dO5ibf8h5ZfROTtOzfqqyL0zdzlbR+kaeDw3BmpdMPm16yEcg
         ZUG7anX7xQ5J5VEV+jz/AcAWsowLZ9EZN7S+2SlMgqjdNhbvdBeqRFHxuAPb1OD0D0xR
         w3OCtWwCwSnEbL01mCfLVTSGTZVL3aBlkkttVbbmZLiemkkMj+0gNp+wxPMzO1vey8qV
         xmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731581223; x=1732186023;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWlZMUn+5t9YCrCLhpFcRSUmdWYZjdBQdfe9Ax62IJQ=;
        b=CZw+RNtHIQP8Mtt+j8/6h+RyjEbD8UVUGSBr0jTa+6hlGmpk0XlOzsCn04DM+5Pxqp
         45kCeuDRnMhwxTL3kkSYpVJMnREi3rEq43BxtfygiuldBhXG5TgLP3naGwkHLEbSyCyf
         3WgAvVPw0+NsHGWjFbvw8WZEWsjOTrTtnQfnpGPay+PgUMFSQ09mLuuciOhd4k6RmRyB
         qSi80dZv4q1hOY+jdI+WlgUFx2H6xdLVpLdAxbC3spbfXr3WAetuJQl5IBqyx07BXAJp
         9iWBVdd0WdSoiiHzQZMtRewb92GlTW7tyGbb+56Of/BHVGWeaa3is/RkSc3SiM0e0reG
         NP5g==
X-Forwarded-Encrypted: i=1; AJvYcCXDnIEFGb+io4rJmv2D2JytNJ3Ct59fvX/XljxJ0+XVvxw48evGNEsYu8QoGjH+R8pttwIdFYLrWLZyxgRB8Q==@kernel.org
X-Gm-Message-State: AOJu0YwSiTLKwAwido3L7cPcIdICnTHP8YMry1edUxM8Hap2Mak1sWRb
	CP269QUCM9GSgRSYspbxYIjcVXm6WeJ3VXepLz88BbrVksLexWEwSGkdBsyuTU4=
X-Google-Smtp-Source: AGHT+IFCt3dnJrMmXLP5JBGM68KhKllWHB2B/JcicNSNBc7OZuUoLSDhuGH0rWp9duJfjvXtgqXYhw==
X-Received: by 2002:a05:6512:2203:b0:536:54c2:fb83 with SMTP id 2adb3069b0e04-53da5c421a3mr837662e87.23.1731581223315;
        Thu, 14 Nov 2024 02:47:03 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653e42bsm140254e87.211.2024.11.14.02.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 02:47:01 -0800 (PST)
Date: Thu, 14 Nov 2024 12:46:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "Renjiang Han (QUIC)" <quic_renjiang@quicinc.com>, 
	"linux-firmware@kernel.org" <linux-firmware@kernel.org>, "Dikshita Agarwal (QUIC)" <quic_dikshita@quicinc.com>, 
	"Qiwei Liu (QUIC)" <quic_qiweil@quicinc.com>, "quic_zhgao@quicinc.co" <quic_zhgao@quicinc.co>
Subject: Re: add venus firmware file for qcs615
Message-ID: <pqoq64hk2jedmqta5fs4ktcadw4getwkgz324vtrzzotcurpaw@zc6dlhbqtsnz>
References: <83153c5ab8374e008d62646f200f9a04@quicinc.com>
 <ng4o7sdejoh4jn4nnarjd4lio4lbx2tiuiz5c6bigjbtxldinr@xl5wx6dmdivy>
 <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab4f83c1-5cd6-a80b-fd85-ccc337c8f301@quicinc.com>

On Thu, Nov 14, 2024 at 09:06:55AM +0530, Vikash Garodia wrote:
> 
> On 11/13/2024 8:10 PM, Dmitry Baryshkov wrote:
> > On Wed, Nov 13, 2024 at 10:50:44AM +0000, Renjiang Han (QUIC) wrote:
> >> Hello
> >>
> >> The following changes since commit 6482750d396980a31f76edd5a84b03a96bbdf3fe:
> >>
> >>   Merge branch 'verb' into 'main' (2024-11-11 20:01:00 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git<mailto:git@git.codelinaro.org:clo/linux-kernel/linux-firmware.git> video-firmware-qcs615
> >>
> >> for you to fetch changes up to 1e7f65883150d3b48307b4f0d6871c60151ee25b:
> >>
> >>   qcom: venus-5.4: add venus firmware file for qcs615 (2024-11-13 15:50:29 +0530)
> >>
> >> ----------------------------------------------------------------
> >> Renjiang Han (1):
> >>       qcom: venus-5.4: add venus firmware file for qcs615
> >>
> >> WHENCE                      |   1 +
> > 
> > Could you please be more specific, what is the difference between the
> > existing file and a new file? According to the soc_vers the new file
> > supports sdm845. Should it instead replace the old firmware?
> SDM845, SC7180, qcs615 can be enabled on same firmware ideally, but due to a
> different signing for qcs615, it takes a separate bin (xxx_s6.mbn).

Can SDM845 handle v6 signatures? It supports v5 and PSS. Or can QCS615
use v5 signatures?

> 
> Regards,
> Vikash
> > 
> >> qcom/venus-5.4/venus_s6.mbn | Bin 0 -> 922240 bytes
> >> 2 files changed, 1 insertion(+)
> >> create mode 100644 qcom/venus-5.4/venus_s6.mbn
> >>
> >> Best Regards,
> >> Renjiang
> > 

-- 
With best wishes
Dmitry
