Return-Path: <SRS0=Rzdl=IS=opensource.cirrus.com=prvs=8737e28d43=ckeepax@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4DCC3DA6E
	for <linux-firmware@archiver.kernel.org>; Mon,  8 Jan 2024 17:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E5115C433C9; Mon,  8 Jan 2024 17:03:04 +0000 (UTC)
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C740BC433C8
	for <linux-firmware@kernel.org>; Mon,  8 Jan 2024 17:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C740BC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4087WAaB017577
	for <linux-firmware@kernel.org>; Mon, 8 Jan 2024 11:02:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:mime-version:content-type; s=
	PODMain02222019; bh=KDxM6mNhXDHloZnZVuGF57DzoxpPxHElH8B2YpDNASw=; b=
	P0QfocodtM9aL3aPXyVv7ujKkQOglQtKWtYs6DmwLLT75zVgjono1zuAySIVzDPt
	HeYGcJCwOYjwT1LAURTk46v51LjZxHTyFiIiKSx3mDdm2vE3qO8//EAYNaALZfv/
	reBp/P+31RarE6qLZQxswmNcw9KR3OXVUAgIITv7aS2LMWFHkgbpybGVhA9Wkv6A
	6jHxKl2t8lZdhhBEHnLD0ZZwJjOTD9sAGMXfDuQctCOOto+UYaeWnyQ647vmDQpY
	HXN2Yst+IZ53SxJ1rVOBIn8sXpnQQ7hwAMsQO9xy/8mSekbGEOL2Dxww0ycHEvaF
	D+EuTCTl6zgc8GIwob9C2g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vf45pjjsg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 08 Jan 2024 11:02:56 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 17:02:54 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 8 Jan 2024 17:02:54 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id AF72E15A2;
	Mon,  8 Jan 2024 17:02:54 +0000 (UTC)
Date: Mon, 8 Jan 2024 17:02:54 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
CC: <patches@opensource.cirrus.com>
Subject: [PULL linux-firmware] Add firmware for Cirrus cs42l43 codec
Message-ID: <20240108170254.GK14858@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 2IvJ_vt2Ec45NsxzTTl5Bjcxgevdw7-b
X-Proofpoint-ORIG-GUID: 2IvJ_vt2Ec45NsxzTTl5Bjcxgevdw7-b
X-Proofpoint-Spam-Reason: safe

We would like to merge the firmware for the cs42l43 codec, this
firmware requires some additional license details to cover code
used within the firmware.

Thanks,
Charles

The following changes since commit 5179d3558a336a270b38555579252ec81073ee5c:

  Merge branch 'robot/pr-0-1704729100' into 'main' (2024-01-08 16:16:40 +0000)

are available in the Git repository at:

  git@github.com:CirrusLogic/linux-firmware.git cs42l43

for you to fetch changes up to b620ad7f5def0f6b3f0c82300685a76f410b4d51:

  cirrus: Add firmware file for cs42l43 (2024-01-08 16:20:30 +0000)

----------------------------------------------------------------
Charles Keepax (1):
      cirrus: Add firmware file for cs42l43

 LICENSE.cirrus | 310 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 WHENCE         |  14 ++++
 cs42l43.bin    | Bin 0 -> 560 bytes
 3 files changed, 324 insertions(+)
 create mode 100755 cs42l43.bin
