Return-Path: <SRS0=56lw=2D=zohomail.com=safinaskar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD74C83F1A
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Jul 2025 23:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6C86C4CEF5; Tue, 22 Jul 2025 23:06:55 +0000 (UTC)
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3591C4CEEB;
	Tue, 22 Jul 2025 23:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E3591C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1753225611; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Cu1RdkP00+7XpHY3Mjq2JUIk2z2xZvzrTSsTqGDEQxzMr8lt9R7OJYoYZJu8y6N4ggm3tLCz2mb2EHJ/BvtDGzj3XHKfSiBoWUw1A3inFHElKEuXWMyJa9zpIAGOBMgh1IE3Ieh4K4ymv6ajbXKj9F5q06vF24g/WyQbMNvDR/0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753225611; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yIr3a5+KfAu5PEyLhxmw8if4Mje3ixMLVstRZjSi/Io=; 
	b=L+PqbNgASota/TlO3QTbLIR0qNxr8e8YPzsbfsjBUnq1OJFpfILq5BSStqE2l6QTdgakg4Vmnc59AXcScR0fxhpYBDBo1Up6I1t72Aszfigcl5q1saFneniWh81GHRRAyd8hGQaAXDIKTLlbDRx8VJPIaBIbIthn40XEH5Zp9A4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=safinaskar@zohomail.com;
	dmarc=pass header.from=<safinaskar@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753225611;
	s=zm2022; d=zohomail.com; i=safinaskar@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=yIr3a5+KfAu5PEyLhxmw8if4Mje3ixMLVstRZjSi/Io=;
	b=CaaEJXhMt9Pmq8CHZJtoG4JdSWD16XlQPiUqomi9bKwj5jxhm40kgKtWwk0UbQG9
	gSzEJczvaBBwEVR3RACe8w0viXL9vnr0zj4DN/5K3UBU5+cJEe5EG9gYdhoEqarHr7I
	taU0AoUDqZ/+sudPY/6SYwk0gUEETxAX4lCavU0c=
Received: by mx.zohomail.com with SMTPS id 1753225608045842.7295880076102;
	Tue, 22 Jul 2025 16:06:48 -0700 (PDT)
From: Askar Safin <safinaskar@zohomail.com>
To: linux-input@vger.kernel.org
List-Id: <linux-firmware.lore.kernel.org>
Cc: bentiss@kernel.org,
	kl@kl.wtf,
	linux-i2c@vger.kernel.org,
	linux-firmware@kernel.org,
	Dell.Client.Kernel@dell.com
Subject: Re: Bug: i2c_designware: touchpad doesn't work after 40 min suspend on Dell Precision 7780
Date: Wed, 23 Jul 2025 02:06:42 +0300
Message-ID: <20250722230642.25243-1-safinaskar@zohomail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <1945bec9a47.7ee2a33b5058.7025603412967539178@zohomail.com>
References: <1945bec9a47.7ee2a33b5058.7025603412967539178@zohomail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227b0408efdca9d5344e2bd0c600000817b8b7241ba8ca31cff2d9ee816fab5e2adf5c194274d45c6:zu080112272db8fbb740a89cec6a72ac400000145bd564ab960a00b929a4e9166cf8100a78e6646a40f7b239:rf0801122cf86b378d59d051b43b55dcf30000b47e712d8c352d072bf833edb503c126536d56792e3bf66fcd75760ca08f:ZohoMail
X-ZohoMailClient: External

The bug is fixed by latest touchpad firmware. Unfortunately, it does not come as part of
system firmware. Nor it can be updated via fwupdmgr. You have to download touchpad firmware
update utility from Dell and run it within Windows.

--
Askar Safin
