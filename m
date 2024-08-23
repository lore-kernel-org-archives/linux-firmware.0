Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC82C531DC
	for <linux-firmware@archiver.kernel.org>; Fri, 23 Aug 2024 09:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 19CECC4AF0F; Fri, 23 Aug 2024 09:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AAAFC4AF0C;
	Fri, 23 Aug 2024 09:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1724405102;
	bh=lBox3i04v9r7q+JiUCbfN2Ws/2slpXblT7B6XEe+utc=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=AkqnLab8GxhxnmGcH0/BsCPaGXJEb4kiCsJOD5mkTbTIhlvVZT29UZbS34H54gIvK
	 PtcTj4nzJguJd//RumfNJC/dF5pXrlfF/b9eiF6BNMWBjYsen/L4fGbv4DsC8Quqqk
	 RrP16dTRyYc68pcvVdUfFW1JQpzZyODwuHVV3G1k=
Date: Fri, 23 Aug 2024 17:24:59 +0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, Vinod Koul <vkoul@kernel.org>,
	linux-usb@vger.kernel.org
Subject: Re: question about Renesas USB3 host controller firmware license
Message-ID: <2024082340-ream-crumpled-9434@gregkh>
References: <mbtpgfzqs5fud7pfrqi6wrzxg5eo47iet5sntdclwdzwo7zzhi@wtn4b55gpcp2>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mbtpgfzqs5fud7pfrqi6wrzxg5eo47iet5sntdclwdzwo7zzhi@wtn4b55gpcp2>

On Fri, Aug 23, 2024 at 10:14:18AM +0200, Marek Behún wrote:
> Can someone who understands legal mojo determine whether it is possible
> to add this firmware to linux-firmware?

Please ask legal questions to lawyers, not kernel developers.  Would you
ask medical questions to kernel developers?  :)

Why not just contact the company themselves and ask if this is
acceptable or not?

thanks,

greg k-h
