Return-Path: <SRS0=MP8O=EQ=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69ED3C83F10
	for <linux-firmware@archiver.kernel.org>; Thu, 31 Aug 2023 08:14:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3E9E3C433D9; Thu, 31 Aug 2023 08:14:13 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FFBFC433C7
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 08:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4FFBFC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 357DD3F17D
	for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693469648;
	bh=FYhSy5iPbL7HXhNGy9NwsBVwmlMYEbpbwagKcdAJ2dE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ScrQu8Z9aXf9hZiUHx7XcIF7zupqxdotnpE1qEuzd4Q8HZubVog2GeZHYptvz2jR5
	 8ORM7TgZZQuADlT1fkevS0iFj5j7pEPGjrj4VH4jQMOsTDpVBYQ1PbV4Lde4vrf9kb
	 ILwIveKludfrhLkyY9AD6REr4pvDBpgou707xpiuHLEStr9ifCjvKR+ESzR5Q7Cbtd
	 EL9JHVsdtAEWcpyGh3pLWgSQjCO0NnSDCmcZw16nZfoJ8R46DyJtFuPOPub5GkgbBA
	 CLlPmylzStdfumcVakOFMBn2U9zoR0NUMcSs/R4xjme7T4k/xNMDjj6ws7FCVmB+81
	 ySzKdHM8Y5gAA==
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-2f2981b8364so294193f8f.1
        for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 01:14:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693469648; x=1694074448;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FYhSy5iPbL7HXhNGy9NwsBVwmlMYEbpbwagKcdAJ2dE=;
        b=K1/xAdM/LWfLVO0OotyWjOclNqg9vKDePAvo3suJUVurbJjpM4qvzbo/ruUfQYUU9I
         XgOQjUUb3t/dQVtnOAYq42PCDVe95vZrSS0V35XDypGxMKAb23Xe5Eew7KuDzQxrfwd6
         /oq8phKd4cxn4gP+cU0LPJ832RtD5KxqR7B+uf6s4cbv155S/z7OIBO4bd0JfKL/g5sB
         YUuSF7219RqjrlaIihR25Z372gBms5JiE4Zf68HuRyFYxhpTjbRv765xXWerUCodWyXJ
         T0KJ9tQkHlaOS6kAl+q/pD1HeUXtWtD3AipvPza60chV+G3aW6RLhwPYCeS9um29XEsH
         zohw==
X-Gm-Message-State: AOJu0Yw0K+p69wWGj/vfhP/Fbcxzjj8qevQKUGJUtu6uxEt2h5n7Fr2q
	aMy0bhH0KUFTNlwMIoC5SU8iftfl9MAsFxM39JPvO/KT9n5qI6u4t4hgnKDNiDpl24hOmS/U+HP
	w0mgUYtNm3MwtHIAfnWaBFdcYeTGeaQuLeMZ6P9Z3JLjqJw==
X-Received: by 2002:adf:fbc6:0:b0:319:8333:9052 with SMTP id d6-20020adffbc6000000b0031983339052mr3609446wrs.26.1693469647965;
        Thu, 31 Aug 2023 01:14:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEO98PjmAEgx0q0+M3dvgBKIA4AUZ3E1OeGWtBxbFt/WCG8VNZ1Hb02n/TD64W97zxZd+skKA==
X-Received: by 2002:adf:fbc6:0:b0:319:8333:9052 with SMTP id d6-20020adffbc6000000b0031983339052mr3609435wrs.26.1693469647663;
        Thu, 31 Aug 2023 01:14:07 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d46c7000000b0031accc7228asm1341107wrs.34.2023.08.31.01.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:14:07 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: jwboyer@kernel.org,
	Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: [PATCH 0/3] Support RawFile in check_whence and update WHENCE
Date: Thu, 31 Aug 2023 10:13:42 +0200
Message-Id: <20230831081345.47699-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates check_whence to understand the RawFile keyword and
updates WHENCE to use that for currently known firmware files.

Juerg Haefliger (3):
  check_whence: Recognize RawFile keyword
  WHENCE: amd-ucode: Use new RawFile keyword
  WHENCE: Don't compress qcom json files

 WHENCE          | 47 +++++++++++++++++++++--------------------------
 check_whence.py |  6 +++---
 2 files changed, 24 insertions(+), 29 deletions(-)

-- 
2.39.2

