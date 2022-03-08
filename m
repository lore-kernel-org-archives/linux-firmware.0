Return-Path: <SRS0=pDtz=TT=coelho.fi=luca@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DE4C433F5
	for <linux-firmware@archiver.kernel.org>; Tue,  8 Mar 2022 06:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 724E8C340F4; Tue,  8 Mar 2022 06:41:44 +0000 (UTC)
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EC36C340EB;
	Tue,  8 Mar 2022 06:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EC36C340EB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=coelho.fi
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=coelho.fi
Received: from 91-156-4-241.elisa-laajakaista.fi ([91.156.4.241] helo=[192.168.100.150])
	by farmhouse.coelho.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <luca@coelho.fi>)
	id 1nRTXH-000SqZ-Hb;
	Tue, 08 Mar 2022 08:41:33 +0200
Message-ID: <61671ef674ed41b326ec39c62676fdd237875a86.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: "linux-firmware@kernel.org" <linux-firmware@kernel.org>, 
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kyle@infradead.org" <kyle@infradead.org>,  "ben@decadent.org.uk"
 <ben@decadent.org.uk>, golan.ben.ami@intel.com, You-Sheng Yang
 <vicamo.yang@canonical.com>
Date: Tue, 08 Mar 2022 08:41:30 +0200
In-Reply-To: <CA+5PVA4BbLaze8-c4R-8LESA9UhsDAJu3_FK4GZKUpVUkPKDrQ@mail.gmail.com>
References: <af43569b2247f7aff44b1ea3680d88dbe083d78d.camel@coelho.fi>
	 <CA+5PVA4BbLaze8-c4R-8LESA9UhsDAJu3_FK4GZKUpVUkPKDrQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.43.2-2 
MIME-Version: 1.0
Subject: Re: pull request: iwlwifi firmware updates 2022-03-03

On Fri, 2022-03-04 at 08:46 -0500, Josh Boyer wrote:
> On Thu, Mar 3, 2022 at 6:11 AM Luca Coelho <luca@coelho.fi> wrote:
> >=20
> > Hi,
> >=20
> > This contains some new and updated firmwares for all our currently
> > maintained FW binaries.
> >=20
> > Please pull or let me know if there are any issues.
>=20
>=20
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: iwlwifi-QuZ-a0-jf-b0-71.ucode listed in WHENCE does not exist
> E: iwlwifi-so-a0-hr-b0-71.ucode listed in WHENCE does not exist
> E: iwlwifi-so-a0-jf-b0-71.ucode listed in WHENCE does not exist
> [jwboyer@vader linux-firmware]$

Oops, apparently I forgot to commit those new binaries...


> Can you fix that up please?

v2 coming in a sec.

--
Cheers,
Luca.
