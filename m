Return-Path: <SRS0=ZPNL=KP=gmail.com=stuart.a.hayhurst@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07CB1C54798
	for <linux-firmware@archiver.kernel.org>; Sat,  9 Mar 2024 05:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1FC1C433C7; Sat,  9 Mar 2024 05:33:23 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CEF90C433F1
	for <linux-firmware@kernel.org>; Sat,  9 Mar 2024 05:33:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CEF90C433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41312232c7aso13097055e9.0
        for <linux-firmware@kernel.org>; Fri, 08 Mar 2024 21:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709962401; x=1710567201; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qWDkvAze7bG7e6B92BCcsYTMHT+8KthtLLJL2Dh8cA=;
        b=bibJDPTtNi6DesztiIH/F+7cpMaRMMuUxm3A2yWFi31YTo0cW+QVBq/uVH0GAE4dGs
         4RruqSlMiBdgsSZY+VtP6MTutlxcxNqKpprDibvdpA9AbzowCIVT+DDTFo/tu+YFKUZr
         SjmuFL36DwobM/HRzjWlzNyqmL2i7nMLAikK5ia4lkn/GKNzMvpfJbrXHEC1DJvW9CYg
         Aoh+VrtplP65bweSGE1wWbK15amUlgIF7ChHghcz0h+at8+IpM79iILzF3y8Yi6wnKCc
         3G3rm69k4lFSLq3W0jOH4abEQfNwonkYs22QzHFWZ6Un0T4J75Ws+bJsq4Ju1eGf/6d1
         2law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709962401; x=1710567201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qWDkvAze7bG7e6B92BCcsYTMHT+8KthtLLJL2Dh8cA=;
        b=a3Csny6dqB2hXnGWeo99obizqLrJHFycSN47USnW8lrcRvP+wNMIDo8wsCCZ/+Zx/g
         DvDP306+YuJQrlQBX3DTfcn7j+jz7JzNEWQsZqMoEBhAuYc1b1FquGfbsFKw4zwOwXjb
         0wBSPdzRJYkirwLB6u7ENnQimsYLyFhHYiUjbZD1W4iD/a4lURioYyjJmZwgX6ZtIKku
         Ft2N+1xU/k2iJXtqSiCPRCyHYLV5Xv16bzsgyMw5woudXG219lNbrHNM4QDq0NKTarD8
         txFpZXOCryZZUFN1K8Vz14Oo0nUFuY1mZxSCJilMSej5G4ccZKOzj8YT2W1u0MxNdYMr
         BcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrrImSwWSG7kej5kssg68wsVeNWtkiiU6UAy3AXTdxsR3umAIXxysfUfw80E7Tz2wbccfzY/jjgKox0xHzqmor5yevvvRiIUyR
X-Gm-Message-State: AOJu0YxoBrdUzPSqRlDSJmoaC9GfNyfAjdup+niYtz/0wJwUOP804aW5
	pcyDD1ePpKQNWDrdJXrtr5q53sLs6Tn1fJKUcvknGyb2UqJns79H
X-Google-Smtp-Source: AGHT+IGMctqPu64zqUioIt40kShbUnUGhAdt9tNjK8FORm3qlMUhsoXBZByUV8hSom23/4/51+tLag==
X-Received: by 2002:a05:600c:4e0f:b0:412:b02d:71f9 with SMTP id b15-20020a05600c4e0f00b00412b02d71f9mr923926wmq.2.1709962400884;
        Fri, 08 Mar 2024 21:33:20 -0800 (PST)
Received: from localhost.localdomain ([109.175.193.91])
        by smtp.gmail.com with ESMTPSA id w9-20020a05600c474900b00412e5f32591sm1395069wmo.28.2024.03.08.21.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 21:33:20 -0800 (PST)
From: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
To: shenghao-ding@ti.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: 13916275206@139.com,
	baojun.xu@ti.com,
	kevin-lu@ti.com,
	linux-firmware@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	navada@ti.com,
	peeyush@ti.com,
	soyer@irl.hu
Subject: RE: [EXTERNAL] Re: [PATCH v1] ASoC: tas2781: Add dsp firmware for different laptops
Date: Sat,  9 Mar 2024 05:33:20 +0000
Message-ID: <20240309053320.37708-1-stuart.a.hayhurst@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <23e85f35969447ab9161068f2c159845@ti.com>
References: <23e85f35969447ab9161068f2c159845@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---

Just following up on this as the licence seems to be causing difficulties for Debian, since it's GPLv2+, but no source is provided, and so it can't be packaged.
Is it possible that it can be licenced under a binary redistribution licence, or have the source provided?

Here's the issue for reference: https://salsa.debian.org/kernel-team/linux/-/merge_requests/1033#note_471478

Thanks,
Stuart

---
