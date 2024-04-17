Return-Path: <SRS0=otPU=LW=sipsolutions.net=johannes@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29609C4345F
	for <linux-firmware@archiver.kernel.org>; Wed, 17 Apr 2024 12:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE6AEC2BD10; Wed, 17 Apr 2024 12:39:45 +0000 (UTC)
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8B15BC072AA
	for <linux-firmware@kernel.org>; Wed, 17 Apr 2024 12:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8B15BC072AA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=cC1J7hdUzg+z+IoiyOESnA1UndoqpxLHI9iR0fMudWg=;
	t=1713357584; x=1714567184; b=Fqp1ncp5T8wVRNpJbBIKhRSr9oWHfeWfuikcr5hk6ofNLZF
	HGMQErNevkOiU0uHDkGCQSNAXOTqb7N6PBmW4b0PSGw03p2+/byw2RS+AtCozUPyltXGwA8SfWBFY
	irlpVuCt6ejMei1c24yc2LXRwsHs4HAkmJdbO1945nZ6xbQqocFexrhJeEANV6NThIxwBz3BsuKEA
	OETZ5m5FH2znfTITe0r97ev3fMJtB8uaQjqVUYz6/n//ofalyr7/m7vL4cQp6h9K2FDt/J/STdvC1
	3W7vF0QKcJ11uedwtXk/2LV6yugCYaC2FA/RJdfGGsrK5+sEeloNQx34gROMc+/g==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1rx4Zg-0000000AwrM-3A9w;
	Wed, 17 Apr 2024 14:39:41 +0200
Message-ID: <f65765b29ea7503fbbaa5e047c95a82de6fc2083.camel@sipsolutions.net>
Subject: Re: putting future iwlwifi firmware into intel/ ?
From: Johannes Berg <johannes@sipsolutions.net>
List-Id: <linux-firmware.lore.kernel.org>
To: Mario Limonciello <superm1@gmail.com>, linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, miriam.rachel.korenblit@intel.com
Date: Wed, 17 Apr 2024 14:39:39 +0200
In-Reply-To: <9aa64d50-cb4d-4118-bc27-86c23410ff8b@gmail.com>
References: 
	<fec30176f437d565d4c1dfc4944373f117d75a64.camel@sipsolutions.net>
	 <9aa64d50-cb4d-4118-bc27-86c23410ff8b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Wed, 2024-04-17 at 07:31 -0500, Mario Limonciello wrote:
>=20
> On 4/17/24 06:18, Johannes Berg wrote:
> > Hi,
> >=20
> > Since I was just looking at some firmware related thing (files for the
> > hardware that might be shared between Intel BT and WiFi), I noticed tha=
t
> > just over 30% of the files/dirs in the top-level firmware tree are
> > iwlwifi-* files.
> >=20
> > While we can't move the files that older drivers might consume, we coul=
d
> > e.g. change the driver to look up future versions/future hardware under
> > intel/ instead? Would that be worth doing?
> >=20
> > johannes
> >=20
>=20
> How about moving them all now and then creating compat symlinks for=20
> older kernels at linux-firmware 'make install' time?
>=20

Didn't realize there even was a 'make install' time :-)

But then I guess it'd be simpler in the driver since we could just
unconditionally add the intel/ prefix to the request_firmware call.

johannes
