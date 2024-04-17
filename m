Return-Path: <SRS0=otPU=LW=sipsolutions.net=johannes@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35330C4345F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 14:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0CCBCC116B1; Wed, 17 Apr 2024 14:10:00 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5AB0FC072AA
	for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 14:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5AB0FC072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=4wcEcjDMioCJvdEJBFh4Rw7VmBBlM0ZDq9pyplVl+bw=;
	t=1713362997; x=1714572597; b=q4vG7qCdB+oBBCjgtDWLpaGwZfUY+MLHMAT9qMlBlSbQCMe
	w4kjRF5vwL8sOZWo6mNQ+2izQHPK5cplFPGq5VF9v98iw1eVcE0Q4inK4Y9m6pxPyS3AXdF9A2Nz9
	hu/rGe+fmBXElgV62nLBimofgNTm/WPv+h8fxcEwbtDDbjJhNKin72YfIE6DthjucyRvwuXuFl4wk
	aGwssDo9qIieVpicYoqZiYMeYin2wMYwNDjrDp3UodkyyShRRjkieEGtNYAgw0DXi5NmOfez/kE8o
	lzPV4Igti6lJstJ157PQxAXVx3qPIHS7VtOfggiXj84yyfGqXBgOcZ2S9c2+a50A==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rx5yz-0000000B0LN-3rBN;
	Wed, 17 Apr 2024 16:09:54 +0200
Message-ID: <2278e0d1026ed336559adbc9ffbf6e945eba422e.camel@sipsolutions.net>
Subject: Re: putting future iwlwifi firmware into intel/ ?
From: Johannes Berg <johannes@sipsolutions.net>
List-Id: <linux-firmware.lore.kernel.org>
To: Mario Limonciello <superm1@gmail.com>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, miriam.rachel.korenblit@intel.com
Date: Wed, 17 Apr 2024 16:09:52 +0200
In-Reply-To: <b7876373-08d9-4948-a49a-e79f42f3abcb@gmail.com>
References: 
	<fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
	 <9aa64d50-cb4d-4118-bc27-86c23410ff8b@gmail.com>
	 <f65765b29ea7503fbbaa5e047c95a82de6fc2083.camel@sipsolutions.net>
	 <b0e70576-a53f-4d03-a503-ddf1f98bbe9d@gmail.com>
	 <b712f48a3e35221b7ff7f4c8cb495b5159bdd367.camel@sipsolutions.net>
	 <b7876373-08d9-4948-a49a-e79f42f3abcb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2024-04-17 at 08:58 -0500, Mario Limonciello wrote:
> >=20
> > Yeah, I guess. Though not actually sure, do we need to support new
> > kernel + old firmware install?
>=20
> I'd say you should.  Here's a few examples of why:

Right, agree.

> So yes; do the symlinks when you move directories.  It's one line in=20
> WHENCE per file that you want a symlink.
>=20

That doesn't achieve it though. It means the driver needs to try for the
file in intel/ and then fall back without the intel/ if it's not found.

Or just look for new files in intel/ and old files without intel/, but
then you don't really need the file move/symlinks?

johannes
