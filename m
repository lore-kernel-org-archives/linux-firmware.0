Return-Path: <SRS0=/UPq=JK=iki.fi=sakari.ailus@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C92C47DDB
	for <linux-firmware@archiver.kernel.org>; Thu,  1 Feb 2024 07:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 204BBC433F1; Thu,  1 Feb 2024 07:54:55 +0000 (UTC)
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A33F9C433C7
	for <linux-firmware@kernel.org>; Thu,  1 Feb 2024 07:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A33F9C433C7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4TQWQW5qpdzyTB;
	Thu,  1 Feb 2024 09:54:43 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1706774083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=O6p3zEawnbhT6RQB/KaHki6DSY8mmUaAtCAlv6tPglA=;
	b=FJ+ZTa/1H/y4dhJY3XG7VupPxG+hNDcA5bYuRypUOhIu7mbvKSj8cg3YfYqhM5pQkypCyt
	8D1eAyD0/FjPlXyvShSzubA1roiGf7sqrXqh5LYPwR3tt6P1l/kTIo2AzbXoJl//DwbWW0
	n1GuoQIGZjMkecEUcOESnz+79naHavo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1706774083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=O6p3zEawnbhT6RQB/KaHki6DSY8mmUaAtCAlv6tPglA=;
	b=qztdQTAucfyJlXKg5cP+FHZnKD20eeW22RiaG6hQAUAvvNlfRIOVy7u3Z1VpXuv6IottfB
	y77cDsdOpKYaK+W0hFU+Qb/N5yW0AndQYSLxy5UyyLUzE5Lu8EsW19m2N+OjeHuOfqV07Y
	quDB3YmnTVSieXEYIexIXSkfHp2qfx8=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1706774083; a=rsa-sha256; cv=none;
	b=oZAuws4ZiwD80/1INMN7Wd2BHxNFriGUi/i0pbVCHxqA/pDN5L2vIxifEfUAz2ssOmsNWD
	YWZdsRgBTuijXToCD5kkz4SdcD5vi6gOe9A5u/zdE3KC/HJDAwfznfb1OA9tP7eROGUnGc
	J3ijVlQ4cLrMkx03MA5C/LPcNicjX0o=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 7AF6C634C93;
	Thu,  1 Feb 2024 09:54:43 +0200 (EET)
Date: Thu, 1 Feb 2024 07:54:43 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, Mario Limonciello <superm1@gmail.com>
Cc: Bingbu Cao <bingbu.cao@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: IPU6 firmware license
Message-ID: <ZbtOQ34d5etYC42F@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbrCw1AVnW6APq56@kekkonen.localdomain>

Hi Mario,

(Resending with correct list address.)

LICENSE.ivsc is already present in the tree. I could add another file for
IPU6 firmware but it'd be a copy of LICENSE.ivsc.

-- 
Regards,

Sakari Ailus
