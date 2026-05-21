Return-Path: <SRS0=sEkv=DS=oss.qualcomm.com=rajesh.kemisetti@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164DBCD4F3D
	for <linux-firmware@archiver.kernel.org>; Thu, 21 May 2026 19:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EFFEC1F00A3B; Thu, 21 May 2026 19:21:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779391305;
	b=A66UiffGeSxyth81GaZk4WmNgsl97SO8+J4TpkxPhdVGtJKw97kWjIEj5Q+8YxbDuP3y
	 ii1yOgL94OKV+WRgQKiZTsnIE9so+Uio5TrxBC6PhdOjNK22r04+IJrToRI4xbbxRBm8E
	 bSpXv2PreAq6oK/CLLeKTDjQDirgblDo2+gaEItUYW1DtcSDlKhXTVPLS8IozW9pzid7y
	 PeZBJehMx4lUB9U8xANumSgt/LjpB38/GHgYm5AArVBRmkAsD5D8gOgpxo1X2ZjNzzRho
	 5YS4gcVM0pU0lPUlukCicPrAdEipT71A4Sp1Qj3x/ODK9Rm8cWp5R41CPazZLQo7WgA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779391305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:From:Subject:List-Id:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UdjgdMErZe8Y9zOMzdDP7Jo9ygDenxIb1c8DlurZYC0=;
	b=vMkdbXD3AswQBHPGv+ax5vcC6TXVAWHLa6m/CN/OzT7EScG/uOWBAzIE9JgN4wukZn22
	 iT23/kDn6/sRwzHKtsXdrUsRZ1PftRg9yAw1ruxQxTL0vOYd26Q792Kh9l2ZT0298Gmdp
	 5qD6LCZEVFJQQx4uLyy4fCvNSHQzcXGDS72yuHUlTs3J4s8hXKUQEsr3ynqeq385LmgO8
	 6Op1fR9XIfOhjJlQk9dbam6zRI2G8zkq5pA9AZKX3zE5SfsFAVN8h8lpBoYdIuwf98Zzl
	 9HslQDUeLorEkSb9pQfKiqNmmSb4hddT1OAf4lIa1fpOrsOrBACjHQ4W0xrn9WTRAgA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNV2sPSL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4KYOpAT;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45BAC1F000E9
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 19:21:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iNV2sPSL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4KYOpAT
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 45BAC1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk4T13532263
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 19:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UdjgdMErZe8Y9zOMzdDP7J
	o9ygDenxIb1c8DlurZYC0=; b=iNV2sPSLXVTj0G3UtifUgScfXudVSM6bCqi5bD
	4tTgWxD8VI9RwKRr7BsWDOuIHyt4tz0+zJfepyjl3/sZrL+98LAMK2y+g7XvCHaL
	gcvlKauDJk3QTkEzQY18oPznjKPI+UrAF6cZ7apSXJ+ofBFbxXtoqN6433vf0j46
	aph8j7+aeRivoJiU166iqMS8ociOLc4F6dIRnl7EASq6uTvCUwzACUfHAqMG+wsX
	xCNnpfQa+q9/fnye28wGRu737klnBOw1AdU7cy6wQ6yPYwHSjxlBbEx/ixLo67PW
	lJY7X37asQRWXtyzHkr+OGT+1KGionWg48oC+QczcefZhCYQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gsd41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 21 May 2026 19:21:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366ded3bed0so4445890a91.0
        for <linux-firmware@kernel.org>; Thu, 21 May 2026 12:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779391297; x=1779996097; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdjgdMErZe8Y9zOMzdDP7Jo9ygDenxIb1c8DlurZYC0=;
        b=D4KYOpATSBBBgFYHfKSH+tsTumQsUkhwuGizG9zUr/ESxWdeNU9BXSt87a91m6cXKl
         DhJ3EsU29DLkTEs0+VAhzgm/ORVQ5n03l1HOoIt4YaQooY3mG/4Zc9x4BHbgiQUmo6vC
         jRGJZMRQ2Dx1W7t3SNf5XlMw44Q+dHw9OSQsG974BOfJfg+V+lzfa3sDk1YQWR2G63+B
         azEhfBarQcSM1CNKE4fkQRfQJBYDqEvqgFXPbvR8yxlCLxDRf7lv3okJzmsGQog2jxYR
         80CpCSkmpK+JdNoZOYwqJE5Tpqt/aVPZtm906/P9998nZA+zh6k7Lla83pTmN1Qo5qSi
         0Hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779391297; x=1779996097;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UdjgdMErZe8Y9zOMzdDP7Jo9ygDenxIb1c8DlurZYC0=;
        b=arvx2xy6PxRtvDfuDuy0SczMB0zf4UMxFuB7hAhJqH4r16+5WMECs1/4Bahp2wqW3l
         zldzrYXAjZIIkTbPk3OO/+FIDSfDj2O/arIyL08CQCzqSR/twE/txhrdAmx1bg7F+GLO
         lL+F4ABQ5+GaDjv3QuEzz2THv7LRS1vXO5Lndm3HCxBiPz6ZQehT601B+54VyEA5TeXH
         niEmghWdd9BzoOaYg2NXmhslVrOVL/sfKgYWtjv33C8tBNwVojycjXEGdG0ois8PEbPL
         z/FmURpn10CbZBTYUIEtFcWxrvWvGkpQaTr0rLtYH3WXbahNH6xd6acM5RkDuKjQl6Ia
         R1JA==
X-Gm-Message-State: AOJu0YwJYz1gMD3QuHoMCzxIwMYofx78UG55RMYCSrLF4jvjLU1mJ94b
	GFCpbdq8stykespoh0kAYdksHCe9SqFHktdTSXYPY+LT79tiuTjk6pYPMJaj7HvnOvg0gElnAbV
	N96Vrn+ezsv0XYJSoTBK7+shYWQGHluvdH8/VKVqieQaht6wpsKtjt8KW5d9cVBF5VlJ25D8=
X-Gm-Gg: Acq92OF/TJWecZKSCHXO9EakWWKx9VrAbClSDu7xSbv2imSrF0TY1dJ5cz89Gpf2jIn
	4XBdjONWse+AvLAFjX8XyZmyqRHRisWL/TWzYCqjN1QnW6JuvBVsW3CzwPQ59mhhEmc5ntNTx7H
	kLxJ2niT+ZSpQbPMonmSfKzEachUl4WUscd6KCBzYZsIc6kCkKMDHSo/1kozalIzIR/ym4mdBAi
	60c0GjqBpI/rwJA67ycHMVM6Y74klRKDl3dkURafCX46zOg3M7icMFiEUn+sGkgwieokBIQ1+vX
	qhfEFR6f8OvYNP8UPl0L+A0fqlkZbamBU4p1EuYDGYk7FIOhv12RMy6UPp7nsw8SrMeh4i6AVgk
	bato31fLiZkE+xo8haCHnTjZRt3lDzR5pIY5ri3tGUqVrHwa8WTUWnqYWWQ==
X-Received: by 2002:a17:90b:164e:b0:369:e9a2:6b with SMTP id 98e67ed59e1d1-36a6c7bdd25mr70488a91.13.1779391297531;
        Thu, 21 May 2026 12:21:37 -0700 (PDT)
X-Received: by 2002:a17:90b:164e:b0:369:e9a2:6b with SMTP id 98e67ed59e1d1-36a6c7bdd25mr70474a91.13.1779391297022;
        Thu, 21 May 2026 12:21:37 -0700 (PDT)
Received: from [192.168.1.37] ([49.205.253.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5b323aa8sm1383650a91.9.2026.05.21.12.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 12:21:36 -0700 (PDT)
Message-ID: <b84a2515-8d03-4dba-8aa8-5fdeac519b4d@oss.qualcomm.com>
Date: Fri, 22 May 2026 00:51:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Rajesh Kemisetti <rajesh.kemisetti@oss.qualcomm.com>
Subject: [GIT PULL] qcom: GPU firmwares for Shikra chipset
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a0f5b42 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Z6h7zyS1wNcpBmmG0rpaDA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=4LTpKG-venjkW9gD2z0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: 22sgpl-GLTNPuWBm5fjJVnXAA_tNLnon
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE5NSBTYWx0ZWRfXz7tJ3Ausogcd
 0FiqcRXWcd0S+LgNbHYig0LrKz5k/CzW3ehpFAcIeHzzU8eN9sK6l3lst8BfNUP/0orw05nyXNR
 BcOYepcQCw9lUtr6XBzpC+uMBcUZTPtP6raCrjOZkR5PzP6SkRvo2q0pmMhSAI8ZSODqW+iRZ+N
 x4xhsvGlums/6tXzFolGYy5h+QogBfOzfzbrE5NzZO18xIvqCVJcRuf2BQ4Ue2O8j1TtjMpAC96
 SIkx23zYr7RS69Y9zYd9jlOlbq1QHcjD/blm6R3gXIgCmeCkffcUR7dFoqPDHLxfCoRYqm7jCOT
 aXA9ntSpLyMdLzkkdAdnN+4WoPnFRS25sD5mJnEm5ACppLPCm9o3fo933ER+kJ+AD8RiS2tkJCC
 4goFeukmpWG0ugTA6kAy98aaORJwoIMih6QRMxqzAlU+3WIQHVq84V8udGfnqtKvrIF55eplOgT
 /p5uLK4JmsM2hbYTJnQ==
X-Proofpoint-GUID: 22sgpl-GLTNPuWBm5fjJVnXAA_tNLnon
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210195

Hi,

Please pull the gpu firmwares required for Qualcomm's Shikra chipset.

-Rajesh

---
The following changes since commit 0b3d2f91df7cf5da3dbd15decaf01e8d849f4a2b:

   Merge branch 'robot/pr-0-1779371264' into 'main' (2026-05-21 14:12:07 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git gpu-fw-may-21

for you to fetch changes up to ef77d60eebbacc4abeb266e0615d60af2229bd32:

   qcom: Add gpu firmwares for Shikra chipset (2026-05-22 00:18:47 +0530)

----------------------------------------------------------------
Rajesh Kemisetti (1):
       qcom: Add gpu firmwares for Shikra chipset

  WHENCE                   |   4 +++-
  qcom/a702_sqe.fw         | Bin 20388 -> 21652 bytes
  qcom/shikra/a704_zap.mbn | Bin 0 -> 1054188 bytes
  3 files changed, 3 insertions(+), 1 deletion(-)
  create mode 100644 qcom/shikra/a704_zap.mbn

