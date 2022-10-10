Return-Path: <SRS0=T6kW=2L=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE23BC433FE
	for <linux-firmware@archiver.kernel.org>; Mon, 10 Oct 2022 22:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6A988C433B5; Mon, 10 Oct 2022 22:45:28 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45E28C433D7
	for <linux-firmware@kernel.org>; Mon, 10 Oct 2022 22:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45E28C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id j4so18670920lfk.0
        for <linux-firmware@kernel.org>; Mon, 10 Oct 2022 15:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ojWSmygiziuSMKGh3XbZGWS7SbAi/9HsoxfpH+m8lLo=;
        b=gZlEGIYHv5Yda3m/gkN6SfDBeVu9EFOQN7P0fTjQQrMcfVmC7NQrf3NzO7a1N8a61F
         WlK08fZAnFbiTv5p15MktG9cXvHFZ8BEd117RCFUTZGABRsXmKrn56uy2bUtiHjBvItc
         P78Yy0pbqsLBVNrgT+e/yreJ7kJSSVvaNwSXUeuBr+yUov4qQYGXuvJJIXuT8CGZ8eYJ
         FfVcZnePCE8h1zeT1VsnXcsNzT7bKd4AvuMxO19ELCDOIaJhSBlRpYwlFhE2ucyZGsxx
         /74t3vcrO+lATfBoOkcvkgXYrDLQ2c44+R6NxhcoaXAK8HDDS2baUT4WS8wGoMsDhnXX
         iZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojWSmygiziuSMKGh3XbZGWS7SbAi/9HsoxfpH+m8lLo=;
        b=FoMpVE6eSFHMpGoKcmckhat+guWllTeoeYdseLUdqvRT+W5kh67U5tmps6Urfno4cy
         bUw4VKc/iS2MyyxBj4VZAfSQ+Y26qqdzUaDhQG0eCS0NlRSMINkjPecumCzLeIqloPZg
         BpesHNEhVcdH3zQ9bBmwIZvhOD6IJOvay7NAP6OEzfPxVjysLHZFrR9d7fZquNlv4JHY
         cmyG90dZdcmin/E1zy3DGFJCb0Jv2TyODECf76ruaOXEaA/qU1YH/+8g19V5ebzLEJNn
         p40Gyqe0CqueMFJ1U9xyyNRiOcM+ZpKbV8ZTlOJU0WNzkqAtPwSEUgphWX5PN4Ipw93A
         1SPg==
X-Gm-Message-State: ACrzQf0IgBTEDEBhiUW3s5HYQET/H7aSuHvawwZA9gygtkDmIyqNaQ2G
	nt+XLnTm/eamc+pVectnSu8qWgBvA4tmDA==
X-Google-Smtp-Source: AMsMyM5p1CJmxCtHf5WjzdKCcKLbCFjNxJi+YH+CB8LLEucq2hy6XvfgdYTs8HMsYomnPJ5aQHyC/Q==
X-Received: by 2002:ac2:5a5d:0:b0:4a2:3d64:8ad3 with SMTP id r29-20020ac25a5d000000b004a23d648ad3mr7596244lfn.530.1665441925095;
        Mon, 10 Oct 2022 15:45:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s16-20020ac24650000000b004994c190581sm1585272lfo.123.2022.10.10.15.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 15:45:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	freedreno@lists.freedesktop.org
Subject: [PULL] qcom: add squashed version of a530 zap shader
Date: Tue, 11 Oct 2022 01:45:23 +0300
Message-Id: <20221010224523.3603000-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fdf1a65258522edf18a0a1768fbafa61ed07e598:

  linux-firmware: Update AMD cpu microcode (2022-09-30 17:33:35 -0400)

are available in the Git repository at:

  https://github.com/lumag/linux-firmware a530-mbn

for you to fetch changes up to 44fa25ddf7d803f347dcdb0ecc52f72268979b92:

  qcom: add squashed version of a530 zap shader (2022-10-11 01:31:10 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qcom: add squashed version of a530 zap shader

 WHENCE                    |   1 +
 qcom/apq8096/a530_zap.mbn | Bin 0 -> 17188 bytes
 2 files changed, 1 insertion(+)
 create mode 100644 qcom/apq8096/a530_zap.mbn
