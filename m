Return-Path: <SRS0=qUtm=NI=dolcini.it=francesco@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B18C25B75
	for <linux-firmware@archiver.kernel.org>; Thu,  6 Jun 2024 10:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 834C9C4AF0F; Thu,  6 Jun 2024 10:18:55 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4F978C4AF08
	for <linux-firmware@kernel.org>; Thu,  6 Jun 2024 10:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4F978C4AF08
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Received: from francesco-nb (31-10-206-125.static.upc.ch [31.10.206.125])
	by mail11.truemail.it (Postfix) with ESMTPA id 106051FA3E;
	Thu,  6 Jun 2024 12:18:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1717669124;
	bh=dN5/fh4QlibifiNZ67tzrgy1jJMvB8O2q5AwC6b+y2U=; h=From:To:Subject;
	b=aoJWMYDLP2NcXP/7VWEY3DSaPqCal2yvSRGxqG6mOgkcvJa3dKRe0rQwgZF7EuFIr
	 4fmIOa3+TmqnyqU9yEobMvCJE1AifCNjhE6ZkqigyPDbYwit4XSxExDYm8pC3g9L7A
	 r6ux2GublRBImbXTCxXBr4fE00N1qNyOhprUEgrB4Ozich5Pb7cG1QvxXfM4Oq4JqP
	 /tMpe2dCB0dL5rOQN7W528wQ9Qwfw1mA0LQn6J32l3FNOtmVVWkoeMyks9oVMUwcwq
	 Y11tj5V0SVu5VSQ8zgoXetGC6ACMDs9HBACsBqmBi7CoKBbAlSvF8jorZ5/hlDX0O8
	 kJnQIcjyjReHA==
Date: Thu, 6 Jun 2024 12:18:39 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Andreas Kemnade <andreas@kemnade.info>, yu-hao.lin@nxp.com,
	Neeraj Kale <neeraj.sanjaykale@nxp.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: =?utf-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@protonmail.ch>,
	linux-firmware@kernel.org, briannorris@chromium.org,
	francesco@dolcini.it, linux-wireless@vger.kernel.org,
	lukas@wunner.de
Subject: Re: mwifiex firmware mrvl/sd8987_uapsta.bin missing in the firmware
 git
Message-ID: <20240606101839.GA76158@francesco-nb>
References: <20240605160013.6bea8d4d@aktux>
 <_pNnwoI9WHlb2EY635KdIv6t_goU-ZYp9Vav31jkFOCf9fCE9EeKdyCea2m-L8pgfsKIQvODlnQLhQqmWSYip9e6FFZwaJHL5-u5rdOS_kY=@protonmail.ch>
 <20240605174709.5043af8f@akair>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605174709.5043af8f@akair>

+Neeraj

Hello David, hello Neeraj

On Wed, Jun 05, 2024 at 05:47:09PM +0200, Andreas Kemnade wrote:
> But that is all legalese and I am not a lawyer... Best is of course
> something officially added from NXP. No idea if it can be done
> otherwise. How to make NXP add something?

Would it be possible for you to get these firmware files added to the
official linux-firmware git repo? 

I am not using sd8987 myself, from what I read in the thread probably
some file name would need to be corrected (I would say in the mwifiex
driver).

Thanks,
Francesco

