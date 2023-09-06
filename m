Return-Path: <SRS0=1Xq3=EW=linaro.org=srinivas.kandagatla@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7BCEB8FC7
	for <linux-firmware@archiver.kernel.org>; Wed,  6 Sep 2023 13:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30EFDC433C9; Wed,  6 Sep 2023 13:02:41 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 27F9FC433CA
	for <linux-firmware@kernel.org>; Wed,  6 Sep 2023 13:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 27F9FC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-68a3ced3ec6so2996150b3a.1
        for <linux-firmware@kernel.org>; Wed, 06 Sep 2023 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694005359; x=1694610159; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQsTGl3+Eqh8ofFG3E7a6oVL6W+DJ0mz15j0T493ubg=;
        b=FT0399nU8kqTzfHw5BimmOrmHE4sHBAbEmx3eMirAubFGoTmLKG0JdSimO95MqXfRR
         knV2qBb2cFnUZLd/xGueiz3UEB3/qV2Pyfmd7GNskcJa1H1Gim6e/6aUK1F7UphPZtnf
         oAm8E/nH7703SOFrAbMNic1hknozydo5KzAHJ4vbuxyhrSv6xL0bk64h2Vb8Gv5cFMZA
         fKoVRYg98wXpI9qb0Oe/43V2Kt4njNVWeBhCekxG9AjI9O4OWBYdBT5TDWsW4uBpxnWF
         yPTRtFWehW3+ahp/wFrvJwKS+ls6Gt7OW24w2rgWetfnZ+7HvlxdNeEbw93OxESsy/m3
         8goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694005359; x=1694610159;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kQsTGl3+Eqh8ofFG3E7a6oVL6W+DJ0mz15j0T493ubg=;
        b=e1MR7MHX8g+851fu4tgNLmkzIJUTueJR7RrGPpNOOjSwQWnRVHwh6xvGtr6D39gXMH
         DD0W6zdK2vQczchPUHwBrLWU6c3e9Jsk5mIZUbSxHnr8nVZ1RUHKuUB17++f/U6BQLRz
         eVDfY85xzjT9zbp/SJu1mMqFc21aVZRTJuqhw1oNB3ciwdYXypbIh3k7WsKg2hEH6Oz1
         Ie0cUss5znPgI8WZCvzVM5GveRp4M6m/IIufz4pGNavhL2gC+syjuKl7F2axNBIuH7VQ
         CLeISKLhAguqnPl3EAS/dNTJ+iDmQr4A+BSPq3iPov5yXSXgT/nsvISxzekzG0eWrGGA
         HPGQ==
X-Gm-Message-State: AOJu0YzZuuicPGQpTAUlgSmmY6JWSJepUWIddq93ZF+Zn+0ZSNCHpKJy
	dShNjBiah39jQv7c4xAOS1dLto1/hn0DzbdVqtE=
X-Google-Smtp-Source: AGHT+IEcMCeoZQMFYj68Y9qGshts5Ugye780JxuFDp52HtImzvXKsQ1OEjGhmMlAwwLcyTIvb+vG/Q==
X-Received: by 2002:a05:6a00:3983:b0:68c:3f2:5ff9 with SMTP id fi3-20020a056a00398300b0068c03f25ff9mr17119847pfb.7.1694005358807;
        Wed, 06 Sep 2023 06:02:38 -0700 (PDT)
Received: from [172.20.5.224] (076-053-041-226.inf.spectrum.com. [76.53.41.226])
        by smtp.googlemail.com with ESMTPSA id e4-20020aa78c44000000b0068be216b091sm10806039pfd.24.2023.09.06.06.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 06:02:38 -0700 (PDT)
Message-ID: <7d49d791-bea2-e163-d8db-71866cf7713b@linaro.org>
Date: Wed, 6 Sep 2023 06:02:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: "dmitry.baryshkov@linaro.org >> Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>, Johan Hovold <johan+linaro@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [GIT PULL, v2] Add soft link for Audio topology firmware for SC8280XP
 X13s platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


The following changes since commit 20d250e3e9093486a5b70daa942ffbaa3bade901:

   Merge branch 'mlimonci/make-dist' into 'main' (2023-09-06 11:15:24 +0000)

are available in the Git repository at:

 
https://git.kernel.org/pub/scm/linux/kernel/git/srini/linux-firmware.git 
sc8280xp-audio-fw-fixes

for you to fetch changes up to 7d94e0fa84701f0c01877c21cf4857f94fd367ab:

   linux-firmware: add link to sc8280xp audioreach firmware (2023-09-06 
05:55:50 -0700)

----------------------------------------------------------------
Srinivas Kandagatla (1):
       linux-firmware: add link to sc8280xp audioreach firmware

  WHENCE | 1 +
  1 file changed, 1 insertion(+)

