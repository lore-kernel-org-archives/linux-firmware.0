Return-Path: <SRS0=WtsJ=3U=tuxedocomputers.com=wse@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C81CA0FED
	for <linux-firmware@archiver.kernel.org>; Tue,  9 Sep 2025 14:31:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99CB6C4CEF7; Tue,  9 Sep 2025 14:31:38 +0000 (UTC)
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B478C4CEF4
	for <linux-firmware@kernel.org>; Tue,  9 Sep 2025 14:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B478C4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (p5de4594b.dip0.t-ipconnect.de [93.228.89.75])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 6EC4D2FC0052
	for <linux-firmware@kernel.org>; Tue,  9 Sep 2025 16:31:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1757428293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Y5Qpr3/3VzJbF8FkQfpNC3FSGj3sDYy89u3EKT8I98Q=;
	b=Q0l06c1DpzilGJXDqA8v1M2s6XUigLGL6h62nTQCejxGONG8rk3N5cnfcY7W1mhy4Xf8lD
	QjyCo+mXZBQ123koYUxoqxH5B/47RgAWW7fpOJnrxFXmhJ7Cj7RH/BuIRWq9wf1X4IPnQD
	Bdl0yPZhlzYrI26ERN9gQhI9M4NZYD8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <5277e61e-3096-477e-b993-bd955be3306e@tuxedocomputers.com>
Date: Tue, 9 Sep 2025 16:31:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: Upstream ACPI fixes
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

is there a way to upstream fixed dsdt and ssdt ACPI tables?

Best regards

Werner

