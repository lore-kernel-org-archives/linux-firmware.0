Return-Path: <SRS0=5gqD=UY=linaro.org=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F80FC0218A
	for <linux-firmware@archiver.kernel.org>; Sat,  1 Feb 2025 09:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 315F0C4CEE2; Sat,  1 Feb 2025 09:26:43 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B96AC4CED3
	for <linux-firmware@kernel.org>; Sat,  1 Feb 2025 09:26:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B96AC4CED3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5439b0dd4bfso2488117e87.0
        for <linux-firmware@kernel.org>; Sat, 01 Feb 2025 01:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738402000; x=1739006800; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lkAVFlncd8O2uBJpUclmd+7qagg8/sQsjazd3KGvCQ=;
        b=hTvxabDaqX3bmPAufXI7XsF/bLxpU/I89HwTA0bZuWrPf97vP7x0Zh9aHObLXbDlG2
         PUioxhQ+eyFzd38nkTll7kigBbj4/LQevST2xhD0t8KwDVvzNI95fc0In5J9QGcemL3L
         7ZjeFrM6aCdZ2HfcGSF2DGBc86XacpIrQXT5Lvm8DTGhNSYRTMkfvzCAaZf1QPyXiwjI
         BumLy3DmfCcBpPFtebQAkezHfBNZgKa1qWLffpuuqIuT5ynqYtpDVjPS7JLbsqX9jlBH
         Pyyz6lh+Euh66sio42l2niOt/rZ7DLP9RZDyLSf/B4qwfHRpRfRZ9D7pyR5nh6/yc52b
         vU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738402000; x=1739006800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lkAVFlncd8O2uBJpUclmd+7qagg8/sQsjazd3KGvCQ=;
        b=pKGZvQxNemI4s62Jn+po+V/5lmxCdMqFoSatsTeORH8LxTS0Q4d3+VQJT54oYYBxhG
         Htgl5XCFsNpCo3gw6ob9K6bRhK23qbib+PhxwYt2I+ZafL4Fds5DqNYs2Ryli4KGv1Z4
         m9AeYUpo90FvlsJXEye+CRAlT8V86UbHFmczPY5XnxXbEU7/0If+G17qJhtuBkWExP/G
         6PtBAnouJ9xKEKDnqk2zqZblvj7rWGZkeGv5pbXa4ncQsF5NLfG3FBjt9wCHtyom11Za
         hp1T/FJ3j4fiQ15BMxO+ddx3bsMq9mLU4v31qyNFI3jOBYiIxVr9bcLyO5xXltMS/SYE
         8gaA==
X-Gm-Message-State: AOJu0YyUTamVYBZr5TH9oD3qPVraq8BvjPGL7XAjHi9MZQIY2yJ7npXi
	Xl3RdShYwUdcS5RfLQ9AOY5a+6RjaeJf0OkW51OL070OzyQT/c6eQaByeKuFGwLJ4AxwoseiYRM
	p5eVosKXn
X-Gm-Gg: ASbGncvDGtQsiLLr1kslgRfOQ8NNbB4A1F/djiD3PJji1Gspne9aiW31WaOQD1QvyOw
	VSQ9jHlrjOlEl4fpbpdjt2K5vtp9mI/97C9ERtj/MBSuxa3/OR3LYHqPUlv3QASB6m5qy5eH13n
	u0n8pn2iyXoUBXhXuZ3tt9gc2bW1AN1I/FzCgnc7GVxNAJYyWbj/G+YBrV8B/qCQaLky1yxZKxc
	nRjqkzwep5Jm0cBw6glUM5oAYBLgTIXxKMdcItyFayKT/Kn+ToH+U8PwZEGdvzqotE7/alsAr3M
	rWIS/TigqT1fWi55JTDa+7H4Q8MOeA+LiIPhP+dshxTjJXs0/+gjw9q830Y=
X-Google-Smtp-Source: AGHT+IFdlFZ5dNARUrIwPFFMM4Ulc12c+BIW8bOzG2mjdWELNckVu3AI5qPtqL6aAYTJ8Y2CqZ6yDg==
X-Received: by 2002:a05:6512:68f:b0:543:e469:2ff5 with SMTP id 2adb3069b0e04-543e4c02ebemr4783802e87.28.1738401999802;
        Sat, 01 Feb 2025 01:26:39 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebebe6a3sm695898e87.219.2025.02.01.01.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 01:26:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Zijun Hu <quic_zijuhu@quicinc.com>,
	linux-msm@vger.kernel.org
Subject: qca: add two more NVM files for WCN3950
Date: Sat,  1 Feb 2025 11:26:32 +0200
Message-ID: <20250201092637.3358518-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 722d0d1271dce547df152e5d6db84c139b9f83a7:

  Merge branch 'robot/pr-0-1738348854' into 'main' (2025-01-31 20:18:00 +0000)

are available in the Git repository at:

  https://gitlab.com/lumag/linux-firmware.git cmbt

for you to fetch changes up to 6b12b9649a91d08163d7f62d52afbf6237953182:

  qca: add more WCN3950 1.3 NVM files (2025-02-01 11:23:54 +0200)

----------------------------------------------------------------
Dmitry Baryshkov (1):
      qca: add more WCN3950 1.3 NVM files

 WHENCE          |   2 ++
 qca/cmnv13s.bin | Bin 0 -> 1641 bytes
 qca/cmnv13t.bin | Bin 0 -> 1641 bytes
 3 files changed, 2 insertions(+)
 create mode 100644 qca/cmnv13s.bin
 create mode 100644 qca/cmnv13t.bin
