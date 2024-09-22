Return-Path: <SRS0=y8fy=QU=gmail.com=fujita.tomonori@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75901CF9C6C
	for <linux-firmware@archiver.kernel.org>; Sun, 22 Sep 2024 14:48:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B6C3C4CEC5; Sun, 22 Sep 2024 14:48:26 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BB0BC4CEC3
	for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 14:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BB0BC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7db4f323b12so1825709a12.1
        for <linux-firmware@kernel.org>; Sun, 22 Sep 2024 07:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727016505; x=1727621305; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vxp0JqMbvTnU7DZA6Ta+xc6/Wz8SVjMKg7wehnZ37A4=;
        b=dKOEZ6X1QN7mIO1WZUmxN44eUCNmH8wJYiPEgUuMAncH2/lRdiIpptIBBqB4xCbFgb
         rkfFobqvIicrlwS+ppguf7lSOY4KZArxUkJGBWWFWsabS+hI5pyc5B4LQw1B1Q1MS21A
         RqbnUfGRpvxzfQ720cB/OUhXKdkNI8od4Py57Sp+KRqvcjH02DtRuFSk/BqbLyhVWy5E
         VklD/QDbKeYdiXgTK1XJp6aOI0Tl6vZ/azgcB4hTtl7ZJoD/P3pMKCcIN7RJM2hS8/iw
         PBhNfkTFwKFzUrdiOWSouIYOR+4TPznk1Rv8nEv71rss043JjjbCJQG0kL2vG7i375x4
         13CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727016505; x=1727621305;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vxp0JqMbvTnU7DZA6Ta+xc6/Wz8SVjMKg7wehnZ37A4=;
        b=TnHMjI5OQwaZY9e5NwYyNG1ho9Rbt4tmFyS2frLsRLyViyg4jssD0B8xlul9anVucl
         GWQQ6Vu8NsGxLeKZbSORJBIZTl/csyP4QEIHbbuapckExx0eopn8v2M7RUZkwhV8+6kZ
         sPK/tHpuqdAKKnPXag7PajtIru0pYuWBLwVU5GPKqOGOfbjNv5JTrtmOl0nmweyiCIQn
         kX4YA5PbsvpSbLeXqUoKIaw+GtTYAG8HR2KTpzVjXmber70PWWC262RgpldVxhIOf2po
         olPPbHm7kpC/FZQ13YiGTqtwWRpyWYFPi3Lpyz22wjspyluY1ByKm1O/yzwc8x/fSdxb
         2N7A==
X-Gm-Message-State: AOJu0YxzM2115heyLofhd6ofBRp51uWpjKTd5cbJIxb02nD4yOZFdps3
	+egcfgnbqk0sUCiF1yiBn2toQykBEnpVc+foT0weOcKbXZx5fvd5
X-Google-Smtp-Source: AGHT+IGYu/2/SmzX0cO4oHp3TlfcTiP+BRDHSa75tSW4oZf8KpZkkZSphduP4zFoOOREM/0FINzjQA==
X-Received: by 2002:a17:90a:fe96:b0:2c9:9658:d704 with SMTP id 98e67ed59e1d1-2dd80ced355mr8022297a91.40.1727016504568;
        Sun, 22 Sep 2024 07:48:24 -0700 (PDT)
Received: from localhost (p4468007-ipxg23001hodogaya.kanagawa.ocn.ne.jp. [153.204.200.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd7f8ca487sm5538368a91.39.2024.09.22.07.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 07:48:24 -0700 (PDT)
Date: Sun, 22 Sep 2024 14:48:11 +0000 (UTC)
Message-Id: <20240922.144811.2042208012316465619.fujita.tomonori@gmail.com>
To: dmitry.baryshkov@linaro.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Subject: Re: [PATCH] Add AMCC QT2025 Ethernet Phy firmware
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <7xoyvgxj3rs6msm6yb4usnilnvbpgbgnzkc6wy4z6lg77fuklk@nfuybhnmfybi>
References: <20240922102024.218191-1-fujita.tomonori@gmail.com>
	<7xoyvgxj3rs6msm6yb4usnilnvbpgbgnzkc6wy4z6lg77fuklk@nfuybhnmfybi>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Sun, 22 Sep 2024 17:35:23 +0300
Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:

>> +Driver: qt2025 - Applied Micro Circuits Corporation QT2025 Ethernet Phy
>> +File: qt2025-2.0.3.3.fw
>> +Version: 2.0.3.3
>> +
>> +Licence: GPLv2.
> 
> If it is GPLv2, where is the source code?

For example, the driver is available at Edimax site:

https://www.edimax.com/edimax/download/download/data/edimax/global/download/smb_network_adapters_pci_card/en-9320sfp_plus

Tehuti Networks went out of bushiness but some vendors still sell
products using Tehuti's TN40xx chips and distribute the source code of
the driver.
