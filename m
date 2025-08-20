Return-Path: <SRS0=MIGA=3A=squebb.ca=mpearson-lenovo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5322CA0EE4
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Aug 2025 13:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A06A1C4CEED; Wed, 20 Aug 2025 13:26:31 +0000 (UTC)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3A84C4CEEB
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 13:26:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3A84C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id 6AC64EC0C5D;
	Wed, 20 Aug 2025 09:08:38 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Wed, 20 Aug 2025 09:08:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1755695318;
	 x=1755781718; bh=sQu5uX7DdP0qYWaIAVNfVHNdPMeWKgPxkUGxtdAMrcM=; b=
	hX7pREfx+vFlMJD6GEsZCYUFsHvjhOUl7XaVySs2L/skv66lG2jHWWvRwgfHxzLw
	k6L2hBPZMgmMcD6OIhuKML+pbxZK7+YYjd1bNuRCWoCy3l5JGINv2+mbRgv/EXmX
	mSkggrPpYLtN/y8POIist9WeNJKUzJEQ0Ls+TDr2cBX4WPuXnYeMIieT7c0ljQUY
	CX4XHjAatLQOMj+XAKTy/3vjwEqu/ywFm3dfj9UowHkqYXdZAdq2rboGI7cq7Iic
	sLfAJGDyMud46UICrwcKV4q9MGnXGZwwq2Po2F3JNyIK5BozzxMezIJ5pPHcBZZ3
	MBpt3RT08DJseW8JVq+qvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755695318; x=
	1755781718; bh=sQu5uX7DdP0qYWaIAVNfVHNdPMeWKgPxkUGxtdAMrcM=; b=d
	sax4A2VUPeOBIuWjI3xK+rtEhAKyHmwChoAhyibDOf4dSt16AG5QulvKgFRXtjHj
	9wJdEUSf7rIw9ch5FYOqRUxUvYe1/Jbz8WDDIddiQnlmDYb7ohlTZmAI+3knMZor
	lQMMC5B6TVKtJQYPEh51OTYmj1c8WdKBUElO1oiUrOoldkghHMbaPGUKLg3pe38D
	/LeTEKWOW3yMZCLJTSi7kaYYwMNb9K7NpgIIMdACChDffBH/b6btxsGTaTaXwwVV
	bW+MGJVu2AsIDG16BJqXO3LnlsZ5i2VlpGwYdjwsKg0ZLFAdEcbophXP1HvW00RH
	5xd1zr1XeCnokUeJhI1ZA==
X-ME-Sender: <xms:0cilaKwcS833weSqNBg8pK2tu-X1O5kuRqG8D-JH_FLzuZC8htpKyw>
    <xme:0cilaGTZQ8OmDfgYRh1InxHfHtv1V9SmxxlnGK5YgiLs-bZgRIsWhDsXr1Dgm7801
    pUicYPbx0qkIaDUZUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheekgeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrrhhk
    ucfrvggrrhhsohhnfdcuoehmphgvrghrshhonhdqlhgvnhhovhhosehsqhhuvggssgdrtg
    grqeenucggtffrrghtthgvrhhnpedufefgleehgfevffehheeutddufeffteeitdevtdeh
    gfdvuedvfeegieeihfeigeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhn
    qdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohepfedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqfhhirhhmfigrrhgvsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehprghttghhvghssehophgvnhhsohhurhgtvgdrtghirh
    hruhhsrdgtohhmpdhrtghpthhtohepshhimhhonhhtsehophgvnhhsohhurhgtvgdrtghi
    rhhruhhsrdgtohhm
X-ME-Proxy: <xmx:0cilaEa9DOaUMaJI1Fcr3etQm4XY6y_WG6L9OXTiNqUYBeH63nDkww>
    <xmx:0cilaKSE1AMVQMs4vrFMqGkSzPdXwoOnZmh4X9PKeTyvP4FkTUktnw>
    <xmx:0cilaGySBnP2OicmfTS7qln2kPutp2lap68acsZt8wDyDD3jRFz7_w>
    <xmx:0cilaM1t0_KVyRsByD2Qp9VEtvpu5aKego3BeSj-lrzvOXSHfNV7KQ>
    <xmx:1silaDwXpv1GN4aD5BRl8wfYDILgl0LJqydS6KcHly5kvxi4IqAaUnib>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2DE442CE0071; Wed, 20 Aug 2025 09:08:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AQu48b_tVUrk
Date: Wed, 20 Aug 2025 09:08:11 -0400
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
List-Id: <linux-firmware.lore.kernel.org>
To: "Simon Trimmer" <simont@opensource.cirrus.com>, linux-firmware@kernel.org
Cc: patches@opensource.cirrus.com
Message-Id: <b7e87ad1-c120-4089-8a3f-1e6a0670f702@app.fastmail.com>
In-Reply-To: <000001dc11cb$edb66860$c9233920$@opensource.cirrus.com>
References: <000001dc11cb$edb66860$c9233920$@opensource.cirrus.com>
Subject: Re: [PULL v1 linux-firmware] Add firmware for Cirrus Amps for some Lenovo
 laptops
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Thanks Simon,

On Wed, Aug 20, 2025, at 8:14 AM, Simon Trimmer wrote:
> Hi,
>
> We'd like to add the firmware for the Cirrus CS35L56 smart amplifier for
> some Lenovo Laptops.
>
> Thanks,
>
> -Simon
>
> 
>
> The following changes since commit 697065607ca2e09fe02b0d6c7c2bf7bcc96243a5:
>
> 
>
>   Merge branch 'rtl8723-bt' into 'main' (2025-08-19 13:23:06 +0000)
>
> 
>
> are available in the Git repository at:
>
> 
>
>   https://github.com/CirrusLogic/linux-firmware/ cs35l56-20250820
>
> 
>
> for you to fetch changes up to 8362841c38da7548fa306aba4d1e899a2437ba2e:
>
> 
>
>   cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
> (2025-08-20 12:04:51 +0000)
>
> 
>
> ----------------------------------------------------------------
>
> Simon Trimmer (1):
>
>       cirrus: cs35l56: Add firmware for Cirrus Amps for some Lenovo laptops
>
> 
>
> WHENCE                                        |  10 ++++++++++
>
> cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp1.bin | Bin 0 -> 10928 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp2.bin | Bin 0 -> 10928 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp1.bin | Bin 0 -> 10928 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp2.bin | Bin 0 -> 10928 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp1.bin | Bin 0 -> 11220 bytes
>
> cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp2.bin | Bin 0 -> 11220 bytes
>
> cirrus/cs35l56/CS35L56_Rev3.13.3R.wmfw        | Bin 0 -> 41364 bytes
>
> 8 files changed, 10 insertions(+)
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2347-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2348-amp2.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp1.bin
>
> create mode 100644 cirrus/cs35l56-b0-dsp1-misc-17aa2349-amp2.bin
>
> create mode 100644 cirrus/cs35l56/CS35L56_Rev3.13.3R.wmfw

Tested on Lenovo P1 G8 and P16 G3 - works well.
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Mark
