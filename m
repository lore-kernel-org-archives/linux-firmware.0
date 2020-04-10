Return-Path: <SRS0=U/lL=52=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19845C2D0EC
	for <linux-firmware@archiver.kernel.org>; Fri, 10 Apr 2020 20:10:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F32902078E; Fri, 10 Apr 2020 20:10:44 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F6320692
	for <linux-firmware@kernel.org>; Fri, 10 Apr 2020 20:10:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QWTv+hK7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3F6320692
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-pl1-f178.google.com with SMTP id a23so1001267plm.1
        for <linux-firmware@kernel.org>; Fri, 10 Apr 2020 13:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=TEzQStdSYdhloLcug4DXaAnsCMxdJyW9nYr3FtVVCZk=;
        b=QWTv+hK72PdZq5cqJ7faaym6w0I7k0RD2/G97HiSTKyWdnBydSLmeL4KPnOjc1zL6h
         gc6MnWlVNfUObGSG4VMXLd0lw+dReCzVaWQmPvdirC7w9gWEq6i2a29r/lcln13S3x4s
         R+Wcur2VGIs9mWG2AKRVLoR93+kDA2PNMsAWs1S1yVXLbeEaQRglq0OI34HjHTEwHiD8
         vL3xwl0TpMIZe1CCHqRHAVF35seNl0fNpwpnBBsNjJ6FK9YQGy0dfEVjOrPArPmWPJ29
         RpjzOczgpSHpnxu0/2/DyhqrzIIh54gwCYUvrJcJzkyANbd0zuIFLnVBcycvr9XTjSng
         2VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=TEzQStdSYdhloLcug4DXaAnsCMxdJyW9nYr3FtVVCZk=;
        b=gpgsbDdAys/VvX0Lc+3zvRzko2KqogK4/pecM0+JuHwBdkRmEzlQwygiBOssQEPCQZ
         0GA1f/4LvGmRp6gCI++WM168kpsA1N8HzQIbSe5a1ooo03W8gX2EpJxqjcInIqgOOoxj
         HcjiXPqabWL0AD6R4WnE1e8UepkIBcze/tz6qUWp6SqDkuDb2l8LKpuaVCnItMBgS4Mm
         k9e2noYC73GK/zwXuVFURakyowiDh1ih65SJMFaczJTPqSNram9WEEtJ0iVCFQHoBJw1
         i7aohWiZEfHpdRMUdQXGVUpIR/8M0oLPS/X33Z/Q9cBKRGPWR+mCk1N3WOGxStB1fAHU
         YEBA==
X-Gm-Message-State: AGi0PuaPuMW+gcxU5tJJFUdZDNKBDsoIb+YIdfgzf2mLekwIyd7KTVbl
	b2gpT1gGFEu9ZdEx1v+Byxa0XqqEW+Y=
X-Google-Smtp-Source: APiQypI7S2whQTGYjYEhhnPjoGTyT8li+FcpyC69dz50ZAB2r1GAlmkjf/Sm1dufiH/flEcyV21yuA==
X-Received: by 2002:a17:902:7886:: with SMTP id q6mr6207612pll.237.1586549443589;
        Fri, 10 Apr 2020 13:10:43 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c126sm2518345pfb.83.2020.04.10.13.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 13:10:42 -0700 (PDT)
Date: Fri, 10 Apr 2020 13:10:53 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org
Subject: qcom: Add SDM845 Adreno ZAP shader firmware
Message-ID: <20200410201053.GA786355@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit edf390c23a4e185ff36daded36575f669f5059f7:

  Merge branch 'v12573.77' of https://github.com/erinlo/linux_fw_scp (2020-03-20 07:39:19 -0400)

are available in the Git repository at:

  https://github.com/andersson/linux-firmware.git a630-zap

for you to fetch changes up to e6ff1e706e8befd0530f7300bc7f89203d4fe90a:

  qcom: Add SDM845 Adreno ZAP shader firmware (2020-04-10 13:05:22 -0700)

----------------------------------------------------------------
Bjorn Andersson (1):
      qcom: Add SDM845 Adreno ZAP shader firmware

 WHENCE                   |   1 +
 qcom/sdm845/a630_zap.mbn | Bin 0 -> 14256 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 qcom/sdm845/a630_zap.mbn
