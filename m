Return-Path: <SRS0=8t+c=D2=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A145EB64DD
	for <linux-firmware@archiver.kernel.org>; Wed,  9 Aug 2023 09:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 300FBC433C9; Wed,  9 Aug 2023 09:41:07 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 849F3C433C8
	for <linux-firmware@kernel.org>; Wed,  9 Aug 2023 09:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 849F3C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 860123F534
	for <linux-firmware@kernel.org>; Wed,  9 Aug 2023 09:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691574063;
	bh=GULEPaRqMRULVVJQpWc76Pq4oCOE2Vi05CEF+zz765I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=j8vEqrlsYtHTRJfTQXqImPSHDc8BVGN4/mqGH3LrCyPIYaibOVlA+EQJtrhqxOZO/
	 1yZt92A2goW0+52cYqK+LbrgA2dRHq6LjPK6eD1wgcv3+IC67QtkyMQJl38S4UZpC3
	 efiZ9rN2nl9xvAyuGvbBHYU5Wsa6fpcHPs8LP1egyVljJ9XBYB/b9a38RnESy6a5UW
	 lUQ+rWEI8sdBEOCjDWy7hGSDKfBwmSDFlk+D7wgLtBh81H2llksUsqel+q5wYdEXTF
	 TEzOmRsLMXb6CXlbpG3fdUW2SX9S2F6IyuXhdlmzA7XGNo86TrpYMG0EXhWieovxab
	 KDx9U8jPtEjmw==
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3178ddc3d94so3742342f8f.1
        for <linux-firmware@kernel.org>; Wed, 09 Aug 2023 02:41:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691574063; x=1692178863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GULEPaRqMRULVVJQpWc76Pq4oCOE2Vi05CEF+zz765I=;
        b=kIRkAS8whWSqCfGmPEmXScZeyDPUfLwuM5OLjjN60DS/3C4WkCqnzxx+AmRjZ74Nai
         H67Wj7uC81qMsN1uTNDbNGlDrxksIqHeYwW42SSp4S1V6jfrQ4KIAfOkb8Hz60gVOb0E
         1b2M+nIe8BXxH1P1ip+2uNj9Bk9C6vzWBE31Y3NUBTdyzullm4EIajXQ8NmHNYRnYF7q
         YblyOCdfLv/Ujb18eRxf3oxRtJSCbahAm09pPGY/fs6VJJE4M5/uh6fwJ9IdCpwxSe9b
         LoexmFwpubhRhitOfkY3hBX3DkRiYy2uQ46Cehyfu+diykBrJdWHzwlA3jB6fJ/Ke8Rn
         4Xvw==
X-Gm-Message-State: AOJu0Yyurs3EhxdNJGFieHP55MO417mEhnGoewIsTMU4W3YBVd5xsN+V
	3r0Ic7lPGjVO4xjm2XG07sG3RsjPOGxo+mr/3DBh5STiTDrWr3EoSazSqr8BmTpepjMyz31A9BK
	Jcb7QhFYKYuSWXKgsBJLbcoQ5T7U1gRQf+9xjZtvt5W325w==
X-Received: by 2002:a5d:678b:0:b0:314:3e77:f210 with SMTP id v11-20020a5d678b000000b003143e77f210mr1670463wru.59.1691574063291;
        Wed, 09 Aug 2023 02:41:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqMT6VpwLZTK82XdYXt54otsmDgG/VuOFV/oD7BCyHQ7C1pXiTMEEqaKcJSPhmVm72dEAgkw==
X-Received: by 2002:a5d:678b:0:b0:314:3e77:f210 with SMTP id v11-20020a5d678b000000b003143e77f210mr1670430wru.59.1691574062608;
        Wed, 09 Aug 2023 02:41:02 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d640d000000b003176053506fsm16250235wru.99.2023.08.09.02.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 02:41:02 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
	jwboyer@kernel.org
Cc: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [RFC PATCH 0/1] copy-firmware: Introduce 'RawFile' keyword
Date: Wed,  9 Aug 2023 11:40:58 +0200
Message-Id: <20230809094059.595680-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not sure if introducing a new keyword 'RawFile' is desirable (or if it
should be named differently) but it fixes a couple of issues as detailed
in the commit message.

...Juerg


Juerg Haefliger (1):
  copy-firmware: Introduce 'RawFile' keyword

 copy-firmware.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.39.2

