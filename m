Return-Path: <SRS0=6loB=RG=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2724DCF11C6
	for <linux-firmware@archiver.kernel.org>; Thu, 10 Oct 2024 10:00:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD779C4CEC5; Thu, 10 Oct 2024 10:00:28 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E4A4C4CECC
	for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 10:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E4A4C4CECC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53992157528so760025e87.2
        for <linux-firmware@kernel.org>; Thu, 10 Oct 2024 03:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728554425; x=1729159225; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CoTql/Yshf3Kf+RMh5n71+c5Sdj6mCn/M/Wb5m9FEf0=;
        b=YWL8xK9toiu8gCWKHO+VWzZxukxxyrPJsBF/vzYOHsvwRem5JCTsAi0m6nx9D3ZIIJ
         NmQUeD0atojJoCgb6+l8bQJN4pDS11k/G2A/p68/1WIuIAMdjMG4Hqcm/LeiMyVsZ0WO
         PCj/9Q9ijO01el4qydNFIa6XXwyK7C+AUNBnGYFsqVQyiCiIbAFfBNVehY5LAm5YwUib
         tQ35rwkOsnNaM48650Z1m80UJW/IQr+D6BixZLt1RIwYXORBc/qldB4vaM+WjumiqQk3
         V3sTg63O1YtmVfEZnnWHcM4hruBv3zR3pVFBI9uH2TtzDqGhuZb2Mp7cCO+SccuzOnPx
         wE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728554425; x=1729159225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CoTql/Yshf3Kf+RMh5n71+c5Sdj6mCn/M/Wb5m9FEf0=;
        b=qC2L4mjDGylr1qMWyk1TmvR2lAO1Fl7fX7sead7NPzUBddX6hRXUmyeJ6p+OzmzwOI
         139IRAZZNqS1rEQ/vLA6LEjukFCksYPSlAiPGcfXk8ljNodu7118dFGilp2ljENDeVwl
         lONwRVPVCvKsyrsxBBlxBQ1yQN8r/DnwdvzA/6YVQnFTITH9m5Xm3qdXao/VAZCzhzfD
         e7C+WYQN4HZgkD8Kut0Jl3CyDA1EWL564QQM/o+0LTqmAubEzie4FiDU1HqPxT5V/vMh
         5FiOtV+h2HthbvBS85o+nKmjLpNY7/WL6DrDRkrtGJU0cDwriAwEkH+4OFPZS5ocvpn6
         PHAg==
X-Gm-Message-State: AOJu0YzlIFFcYXeEkgJr0bhoijmzaWOs1T6xiE3gPbBGc/nu9yuHktd1
	C2hVnemzETtuF/KtqF7vhZpN+Kbu1PAZKjSL0JjHuafCrpGf+KQ54DBN/g1hzws=
X-Google-Smtp-Source: AGHT+IEcufiLNeunik/9hY4r4SjtyGiebcXsQISLw4YL008f0PEWQDGRcc6Klpv24PDJ76U9KkldnQ==
X-Received: by 2002:a05:6512:230d:b0:533:4689:973c with SMTP id 2adb3069b0e04-539c489744fmr3346334e87.23.1728554425224;
        Thu, 10 Oct 2024 03:00:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f0f29sm186122e87.196.2024.10.10.03.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 03:00:24 -0700 (PDT)
Date: Thu, 10 Oct 2024 13:00:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: quic_zijuhu <quic_zijuhu@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, jwboyer@kernel.org
Subject: Re: [GIT PULL] QCA: Add Bluetooth firmwares for WCN785x with UART
 transport
Message-ID: <sawsdn6kvjymvocnrb2t27o6qcuj2lpctv465plzfq7io7f23u@nmck7rrgvdbu>
References: <17161839-07cf-4167-be99-220ff23b17bc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17161839-07cf-4167-be99-220ff23b17bc@quicinc.com>

On Wed, Oct 09, 2024 at 04:30:34PM GMT, quic_zijuhu wrote:
> Hi linux-firmware maintainers,
> 
> Here's a pull request for btqca bluetooth driver. Please let me know if
> you have any problems.
> 
> The following changes since commit 919f79f9fb5536c1928a15ac82a2e53183b213cf:
> 
>   Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04 +0000)
> 
> are available in the git repository at:
> 
>   https://github.com/zijun-hu/qca_btfw
> 
> for you to fetch changes up to 2a8ffa36567f300041c6d6d509b897a4fcc42916:
> 
>   QCA: Add Bluetooth firmwares for WCN785x with UART transport
> (2024-10-09 16:01:30 +0800)
> 
> ----------------------------------------------------------------
> Zijun Hu (1):
>       QCA: Add Bluetooth firmwares for WCN785x with UART transport

Could you please confirm that the licence for these files is
LICENSE.qcom rather than the typical LICENSE.QualcommAtheros_ath10k ?


-- 
With best wishes
Dmitry
