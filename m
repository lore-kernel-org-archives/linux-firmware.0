Return-Path: <SRS0=mAre=ER=canonical.com=juerg.haefliger@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F52CA0FE6
	for <linux-firmware@archiver.kernel.org>; Fri,  1 Sep 2023 06:52:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8816CC433CA; Fri,  1 Sep 2023 06:52:39 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9AED7C433D9
	for <linux-firmware@kernel.org>; Fri,  1 Sep 2023 06:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9AED7C433D9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 591603F148
	for <linux-firmware@kernel.org>; Fri,  1 Sep 2023 06:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1693551154;
	bh=sA9Y3nCEJjV1yIHxNoSbjxKV2jNf2pVuWvKC+BpnYXU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=u3fY5f5eppdhCc8ujjmGFkCwQNMo22ugB4KFiABS9bvJZa/WkHzILxTkB5bdeJd0Q
	 kME4dqWajHzYTohQ8HTBBNrjSZ4L0qNwNkiLzTQCTCDzdEvd9tkdYhUuFojYmuo8vA
	 9dw7MhgLhXS83myM70qfFM88ew+4yV2dw7hOciyN1huEOSYNIPDqKq7J8XP2OH/PfH
	 7GlvqLbZW82BUwB52+Sqc0RJPSY8ubXdNxcb+eC0WbWo5iS3Km9EkkPjUeIl0ZoM/D
	 Nk8jAfdN+8rsg8is+60zWuo7nyd191LsF52zGCX+P1z29hWrPwyYFNH19M4gQvBL73
	 ++YPtCEmeHLjg==
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3fe661c0323so10876195e9.0
        for <linux-firmware@kernel.org>; Thu, 31 Aug 2023 23:52:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693551153; x=1694155953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sA9Y3nCEJjV1yIHxNoSbjxKV2jNf2pVuWvKC+BpnYXU=;
        b=I+wBI4+t8uuutnvLWe+HW/oZWaQsM9zobbR47imDxxpuXR7443PljBBZv33lZzePkD
         Ifh6OlUzQESwZJ1LmM6AKvxOyYtT9C+ZBU8IwKaLLHcdmHFQOsZ2qRnhq3B+E63wF1/3
         osan4L0QO9Y3wMO2owDa5rjxPLp/ljfbdoUYRNGkDjmcgh3cl2sDAy9sfiRFwrkLEqlL
         RN9IWGKfIJ6Yuxi39FUT7X0k1eh2VsSGpVSniQjRTKa3fs5IRCtu7ShhdD1SOowTMPNr
         IXABM61H+TVwvn5ym9uttOISbMWkyx1eLbBv+8SarRWhdQw4a+Hojd86LGYcWKxxDJI4
         oYpw==
X-Gm-Message-State: AOJu0YxY6T5KkQEhSUyQuLv9jSd3Wc20Od2GZtloRHu2Mic2VFN3GY6i
	DtbE0srK4/Yr1OKTwVqCtnKn3r/EAowc3atVqz6dGbQjo1guKE3t7IB8pXRLrmCB0QfFqVAo5gP
	zEVmE78m/Pc7C25eJPiQnCE3l4hZFJYzApwfp+w==
X-Received: by 2002:a05:600c:2058:b0:3fe:d7b9:8251 with SMTP id p24-20020a05600c205800b003fed7b98251mr1021256wmg.2.1693551153802;
        Thu, 31 Aug 2023 23:52:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE804eUqIPoQBXDsYXu+7XPA9pyYI5/hZ6ngzeqqr+HZTotqbdEt+fwGKVJHifCb5SDrSJsCw==
X-Received: by 2002:a05:600c:2058:b0:3fe:d7b9:8251 with SMTP id p24-20020a05600c205800b003fed7b98251mr1021240wmg.2.1693551153363;
        Thu, 31 Aug 2023 23:52:33 -0700 (PDT)
Received: from localhost ([194.191.244.86])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bce0d000000b003fed630f560sm3937112wmc.36.2023.08.31.23.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 23:52:33 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: mario.limonciello@amd.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: juerg.haefliger@canonical.com,
	jwboyer@kernel.org,
	linux-firmware@kernel.org
Subject: [PATCH v2 0/3] Support RawFile in check_whence and update WHENCE
Date: Fri,  1 Sep 2023 08:52:23 +0200
Message-Id: <20230901065226.13607-1-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <41fb7957-98e8-4ad6-b958-1e673e7476e0@amd.com>
References: <41fb7957-98e8-4ad6-b958-1e673e7476e0@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates check_whence to understand the RawFile keyword and
updates WHENCE to use that for currently known firmware files.

v2:
  - Rebase to latest upstream.

Juerg Haefliger (3):
  check_whence: Recognize RawFile keyword
  WHENCE: amd-ucode: Use new RawFile keyword
  WHENCE: Don't compress qcom json files

 WHENCE          | 47 +++++++++++++++++++++--------------------------
 check_whence.py |  6 +++---
 2 files changed, 24 insertions(+), 29 deletions(-)

-- 
2.39.2

