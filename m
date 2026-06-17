Return-Path: <SRS0=PtHB=EN=ohlytec.de=support@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 508C1CD98F2
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Jun 2026 15:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 31F621F00A3A; Wed, 17 Jun 2026 15:50:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=87.106.239.90
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781711435;
	b=AUTZts1Pf1AwDcYAjhZUfcNMVAUU+ArFgseTA/I4O5dp89J6Q+alWI9/raU6eFR51haP
	 O+AxgM8h9LL/mZkqhe7O2VwCqsPJxDQzZafhBBZBZQGg+QxzG/okrtwnVxfrNQALtKy+1
	 dbw3Ysj5YDrhq1j2pc+1ZmITHb76JkOrCf1gE2tiG1CS7rmeYEv8Lq6xPv/6u3mx+jsD1
	 2SUIel+GJqDvQsqw+ghneB23co7/Bk2ggPQGg0V2/sypZM/Rq7X4tkNCEOUKmQ0SfpWHS
	 t2by2YG6grsVebzLGMDOCqz7pXjxNwG+NgHmScjwhkX9AFc1gKuD/9jF87wO4TuaoBA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781711435;
	h=DMARC-Filter:Received:DKIM-Signature:List-Id:To:Subject:Date:From:
	 Reply-To:Message-ID:MIME-Version:Content-Type:X-PPP-Message-ID:
	 X-PPP-Vhost;
	bh=PfZwHBrLbWYUpAwglgp10ibF9T+JsQxZMjt2nCkK60c=;
	b=WqpDHYF8Y4upTzzqe3UvyYWuMS/wVGt7hw2StJhgngt2lZ6nrytYNMjdVr0YYPCaJEDl
	 nJXj2xtFwhjEcQYn2PdgKrmYD2t6b2vdI4B8ZGy1vbprwaPWSQTxTW20yhRUUJ/J1BNq0
	 li3b1YPst7D3FbHwJttL0pq1RS1cN4zBf/2HBMTsOB4v7sIjRBPZ0HbQ3qvN4W4hETiWi
	 spAodHEURF4IxSKbavOZPkY6i07O+OGJt5uhTtdtXI8QctM6aBdvR32AqDsS0vJeI9ya/
	 9c0sdaKkcQAD7qmhATK9ZCTBVpH7y1exSIRB8uRXNkHA6crqRiu9XsBUYwzGCkHtXkw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=ohlytec.de header.i=@ohlytec.de header.a=rsa-sha256 header.s=default header.b=uMwvbOPa;
	dmarc=pass header.from=ohlytec.de;
	spf=pass smtp.mailfrom=ohlytec.de;
	arc=none smtp.remote-ip=87.106.239.90
Received: from admin.ohlytec.de (ohlytec.de [87.106.239.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 561B61F000E9
	for <linux-firmware@kernel.org>; Wed, 17 Jun 2026 15:50:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ohlytec.de header.i=@ohlytec.de header.a=rsa-sha256 header.s=default header.b=uMwvbOPa
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 561B61F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ohlytec.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ohlytec.de
Received: by admin.ohlytec.de (Postfix, from userid 10001)
	id AB29A60750; Wed, 17 Jun 2026 15:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ohlytec.de;
	s=default; t=1781709806;
	bh=PfZwHBrLbWYUpAwglgp10ibF9T+JsQxZMjt2nCkK60c=; h=To:Subject:From;
	b=uMwvbOPaka6fTI+litoTcGCLCOtcrRO0FiUPrQjWVi77MvfLrQdVrn3ou8v1w7Tsn
	 YUy8tCItGmLyPPMo9bDbScLoLIcyEl0x1qtFJW8eTLT547zaT2e6sebi76WzVFgkTM
	 mT9QCMQ15QohGcBg57i7sP7SrUCfPzw4u9EPvkJQfrKlLcw1SaMx+ktBYaVhwwdAcR
	 5dz1zs1oGBuSEecH3CDbKesch7QozrDHjP6J/j1SDgB+lNq5mUhUTWwAjX64rNuFWU
	 IprlUPnTpc1l0mPA38qkiHXl8wVk8jgMd0y8hk8eQfIvqrYDst1ibDvT7853bP1kqr
	 P/PNq9byKrvqQ==
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Project Loan/partnership investment  offer/ Kredit- und
 Investitionsangebot
Date: Wed, 17 Jun 2026 15:23:25 +0000
From: Frank Dawson <support@ohlytec.de>
Reply-To: frankjody12@gmail.com
Message-ID: <6faace439214f1cec8c5f2e57cbe45ac@ohlytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-PPP-Message-ID: <178170980608.2326001.8915795275983586043@admin.ohlytec.de>
X-PPP-Vhost: ohlytec.de

I hope this message finds you well. 

My name is Frank Dawson and I represent a private network of investors currently seeking viable and scalable projects for potential 
collaboration and financing opportunities. 

At the moment, we are working with two categories of investors: 

(1)A family investment group based in Qatar interested in strategic partnership investments in credible and high-potential projects. 
(2)Private investors interested in project financing through loan facilities, offering competitive funding terms with an annual ROI of 3%. 

We are actively looking to connect with project owners and developers with solid business models, clear execution plans, and transparent 
operational structures. 

If your project is currently seeking funding, expansion capital, strategic investment partnerships, or if you have been working under 
someone but wants to establish your own business, I would appreciate the opportunity to learn more about your proposal and discuss 
possible areas of collaboration. 

Kindly share your project profile, executive summary, pitch deck, or any relevant documentation for preliminary review. 
I look forward to hearing from you and exploring the possibility of working together. 

Best regards, 

Frank

