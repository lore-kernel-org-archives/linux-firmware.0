Return-Path: <SRS0=qiHn=C6=nvidia.com=petrm@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7604DC43463
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Sep 2020 12:10:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 4A5FB216C4; Mon, 21 Sep 2020 12:10:57 +0000 (UTC)
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com [216.228.121.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05A4120EDD
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2020 12:10:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="IF5nzfwA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05A4120EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=petrm@nvidia.com
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
	id <B5f6898220001>; Mon, 21 Sep 2020 05:10:10 -0700
Received: from yaviefel (172.20.13.39) by HQMAIL107.nvidia.com (172.20.187.13)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep 2020 12:10:54
 +0000
References: <95399f5d3c3f5cccc13981ec861409d1a79ba5f3.1600688390.git.petrm@nvidia.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Petr Machata <petrm@nvidia.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: Petr Machata <petrm@nvidia.com>, <mlxsw@nvidia.com>
Subject: Re: [PATCH linux-firmware] Mellanox: Add new mlxsw_spectrum firmware xx.2008.1312
In-Reply-To: <95399f5d3c3f5cccc13981ec861409d1a79ba5f3.1600688390.git.petrm@nvidia.com>
Date: Mon, 21 Sep 2020 14:10:50 +0200
Message-ID: <87blhzib3p.fsf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1600690210; bh=X9oY/FPzApE6SbKWenpL4y/7SfPH/cXrV7fKcwhIr6M=;
	h=References:User-agent:From:To:CC:Subject:In-Reply-To:Date:
	 Message-ID:MIME-Version:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	b=IF5nzfwA9bZ2VgUTorQw2qGB5yqa8/JJ22Dbd1NGRylXLANKkhBUoaNPjcPNKg9bb
	 tQMrUQoUw7u8bx/11PDkkZfRrdtc/UPgys6L2jhNWIf1WbbnmJ42eO00sUWRm9O7At
	 mT92zScMKzGS/Qm5548f4CKdLh9xBOulYm3oDajBzMhiUG145zkGnb8znnpVaGwgx0
	 wzLvqLXsLk84224kMyOvapD9CFrn6NvoyTJmMSLltrNl3WwSNVjvhqv4ejjobExXcE
	 pq4NFkYwgJPCRfay0E39gUqiI8gMpUAUIgXb0ShcM3VZvRfxjDCxMW4dN7Bba4Je9W
	 y3aRXkdl9+SOA==


Petr Machata <petrm@nvidia.com> writes:

> Add latest verified version of Mellanox Spectrum-family switch firmware,
> for Spectrum-1 (13.2008.1312), Spectrum-2 (29.2008.1312) and
> Spectrum-3 (30.2008.1312).

Apologies, I didn't notice you already took xx.2008.1310. I will rebase
and send v2 of this.
