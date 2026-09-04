Return-Path: <SRS0=D/Am=G4=justthetip.ca=lucid_duck@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B29DC79F80
	for <linux-firmware@archiver.kernel.org>; Fri,  4 Sep 2026 06:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E09B91F01559; Fri,  4 Sep 2026 06:39:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.9
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1788503966;
	b=zuHHZO+8A5kslRlCTm9zvaXCyOGE/nK/86RpyHwK/l8d47s2ityGrWZBoizGKG/Z+JDQ
	 lvN6r9gpe5w2VrEVsEzjpbM+8Qv8bMOCZk2+9j2eBCBPZfmctKf+md3qq/3KYOYGn3i9u
	 TalrNWSg2uChDHLmKkSbuzugYmSWFDs6W3f3xFErCOEjAP7sa43oLxfAgPdhFuv9gl2Bq
	 b71jK4je8VQZRk+YeZcWuOrBaSnNJF1NZUmUrJEtO9DZ1fwYriBIX5w9Mh26jOHHmc34i
	 iq2M3iUUzaFrXwjnuQxars2BiT4OvV/w8xDF6M4F7xt8xwMvCu0JgvFgWzfeecvuYUw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1788503966;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:List-Id:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3d3i5vsIWrW0LnXkTIgLG8qH4rN5A0QE4fwZ0GUTw5k=;
	b=ZNOjP3ssG4HUttTCzuJS7GIj0ThKsAPj+IDw7S/4LEUch4OQcNR0pIvFet+arsDUxDWH
	 fWIpZ2h37UDDbNL8dpOrHJZC7EAp23PZ0KPIx4Sv4qz+luAcNOtPDrBDO7HX7CbrWH/BU
	 LqtpC3DNT6bh3krpk5pUOuxkJgDQNGAcoUpkIegQgQNvaTilKPOI0jqNP6Ped1RaS3rbe
	 rQPtAe42S8dNBNVfFmPwAIi10soxRiq7MsZH1cCSehLHikM/h1nI2FTjt1f9neZGCexZZ
	 jyyofhsN8benHQVJPksx8gec7ofH+F1XU/TpUdPAKlL3oFeLwMpqez/P9ZYYhik8Zxg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=pass header.from=justthetip.ca;
	spf=pass smtp.mailfrom=justthetip.ca;
	arc=none smtp.remote-ip=95.215.58.9
Received: from mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1260C1F00ACA
	for <linux-firmware@kernel.org>; Fri,  4 Sep 2026 06:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 1260C1F00ACA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=justthetip.ca
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=justthetip.ca
X-Envelope-To: linux-firmware@kernel.org
DKIM-Signature: a=rsa-sha256; bh=YGvx98Tz2FML0LvjF/Dg0WhaeyNHH+kTPvoeQxEpaqE=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788503956; v=1; x=1789108756;
 b=oKKJy/rsiAfMv5d0LEd0O5J01zukYQejc6s2JRMaYfrC8R2X//xZ5zaJ2pfefK+5BR81hkrV
 z63HxolL/qQA5XXTNXf9k5kkiNHBOEiKfUPtb8bdBO87lj8bhp1Ii1TpZDGx2+C+4gTQ0LE2657
 WwJvVOgBqsT4NVmAmU90Np7vcguFTbfgCABZslKwHH3aK+tZckqCf0DfaIa7NdmAPXH4U4xHYZK
 DkYSk9a+9LUbHOVIEs2iwvh9fJDn3Q7AfyAO5KgpOzKo2qdjd9l0zplFjrLXOA6MK3RjK0AL9Jj
 gsAJLsrZcmE3i8NA8h8vnF+gcFspNBMJ09u5B7YSEoJLA==
X-Envelope-To: linux-firmware@kernel.org
Received: by smtp.migadu.com with ESMTPS id a199b6197a3cee6e;
	Fri, 04 Sep 2026 06:39:06 +0000
X-Mizu-Trace-ID: a199b6197a3cee6e
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Mario Stanski Jr <mario@getscale.com.br>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	regressions@lists.linux.dev,
	jb.tsai@mediatek.com,
	jwboyer@kernel.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com
Subject: Re: [REGRESSION] mt7925e: firmware 20260813113118 causes severe low-RSSI 5 GHz loss
Date: Thu,  3 Sep 2026 23:38:57 -0700
Message-ID: <20260904063857.55152-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAJe=AAkCeK=-pVve0Ffw_k0UBp4_AiO5BwQ1d2yG-pVe8B0U4Q@mail.gmail.com>
References: <CAJe=AAkCeK=-pVve0Ffw_k0UBp4_AiO5BwQ1d2yG-pVe8B0U4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the A/B, and for publishing the hashes. They made this quick
to set up on my side.

Unfortunately, try as I might, I cannot reproduce it. Same ASIC revision
79250000 and HW/SW 0x8a108a10 as yours, both firmware pairs hash-matched
to the SHA-256s you gave, 5 GHz at -70 to -79 dBm against a WPA2 AP on
5765.

Eight arms: two in-tree kernels, an out-of-tree mt76 from 30 August so
the driver is 7.3 era, power save off to match yours, idle and loaded,
and a ten minute soak with a continuous pull underneath.

  gateway packet loss   0% in every arm, roughly 1000 packets
  gateway rtt           11 to 121 ms average
  1 MB HTTPS probes     3 of 3 completed in every arm
  25 MB pull            1.4 to 2.05 MB/s

None of that argues with your result. You held everything but the blobs
and got a clean separation, and I would trust that over my negative.

What it does suggest is that the firmware on its own is not enough on
this silicon at this signal, so the rest of it is in what I could not
match. Your board is an AMD RZ717, 14c3:0717, where mine is an AzureWave
14c3:7925. Your regulatory domain is BR, where mine is pinned to CA by
the AP's country IE. Your link is VHT40 on 5805 and mine is HE on 5765.

If anyone else on an RZ717 has seen this, that would narrow it quickly.

Devin
