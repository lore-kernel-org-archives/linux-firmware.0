Return-Path: <SRS0=mc4r=ID=oss.qualcomm.com=srikanth.katakam@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5678ECA9EDE
	for <linux-firmware@archiver.kernel.org>; Tue, 13 Oct 2026 02:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30E2A1F00893; Tue, 13 Oct 2026 02:50:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791859849;
	b=cYOnb5vELzREMPMRznNw0naU3DnZJIkWg2J94OwxEpQGyo8yW1Mol2vOQG3+9zsV4IfS
	 0r4oGmqLtUPtPkOgy3LtINg3bamwr3HHhRMeHhooBcCTPXD22HWXHUll704wzqi1D860V
	 S+9FpOvObBwEju+ozIF34ixsIgG6YrbHpi07mL/kGEjaR7XCZB9mdZNqlMtw0QbprbbZ+
	 8g2JF6qndALsSbyHOlxpgnR2D1YBcOsD1r4yDNejF2dykxtBjzZXM94qbtn12VtXH7AYZ
	 8unv4VzCMfCL0qBR9O3LHr8MkrbDtyv1+BahmSfzxG8sPMKGpze9siBpcCmYJCqVKnQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791859849;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Content-Language:From:Subject:List-Id:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=n93SD5QU8DqBSGiig3C83fvSPXqJPhrmAx1Sp8NKSpA=;
	b=fKMXmLyG6kyjXBhuzQAzQzrXKwE8aC9JyBQ/bP3/98pdQuEl1dOpAFgo6JfCgiOfrwDG
	 qpHXMohJtrV8aYpk4eTODm8Wbe/QgkYPFaGf/IKktommE6VsHnTf9DaZAAF7Xk15AZgU9
	 DSu7aCIugq/jfTFJRahavpjJuC3CnjexGYHISXCGHJwrUcNJqy4NgGZNT3tFwND2NmBMx
	 St4M7ySJOl8XZ+/yxC+Lrlw9hcet/a8AXgUSjdJZcy49VDziYs2RHbEBA5vKk2ykluOZZ
	 2Gjm9NwKFIoVfHeIR1IJgpnaf2/LB2RAr9KoZtymuLWYtsQYMhukMf3UJgbJIIEN2cg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOKhUoHC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bu2rfrM0;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EA151F000FF
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 02:50:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TOKhUoHC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bu2rfrM0
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8EA151F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21HKE3223835
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 02:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n93SD5QU8DqBSGiig3C83f
	vSPXqJPhrmAx1Sp8NKSpA=; b=TOKhUoHCSPEkpKCUa4SBd01b21C6AQRVDOqYsG
	AkELQu/cU58Eo0JbDOHUT8i4BmgB+tue9QYks5FQnSMqHFqh6qyay5balhAxvhSu
	O4PABL79cydiIcBpM4hcfyoUi87Bdmup7OamOdVvJfE8iT7RAM6zxkBn+piXiNYW
	rJsRhD5mKILQf/j/4KOt1cYvrtJxEh7JN/j5f+uDgrzVwMkUQMY4+wWQ2jD9u8hd
	EEDcHaIwsokgGZQFNE+dLYyKcqaD6oiZOjvdD6VPB+XU3dtZ9cQABvMdVzQKWBbS
	GQ+QjcfoykdURRAtLadD9ex9bJXA2GBqvgds19EjZrByjwrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7kv63q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 13 Oct 2026 02:50:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df8d1e91c9so52603105ad.0
        for <linux-firmware@kernel.org>; Mon, 12 Oct 2026 19:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791859847; x=1792464647; darn=kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n93SD5QU8DqBSGiig3C83fvSPXqJPhrmAx1Sp8NKSpA=;
        b=Bu2rfrM0k09NlKCNvDvKcnKAAfDJF1YnFlrhULCtp6wRW0/hj0E9yV16tGFLgm9JiQ
         v6l/fjJWnsU9eV4LK7d4aoanBITKgL+0Cqysw9Ww6H3/HJ8EG8xXKAEXr6E6Uf9ePwL0
         5RaW24t5QNCFkEQmcTe/gR62PyzMH1nr5WhcENA9d510jlXN+awWFfxMr0t+tMjoygwd
         SzuD7arKBJslDEM4AWjbwY73MQ/PexhZHFw/udOP02tjHCI3Iz2ZxasW77RKwtPr2I4H
         mzSGaummZgU1kczXtzv/qjgHOGeE0PLgQEB//d4aTTPsuGExVPiSNAKSSmxlEWAmVhOn
         KheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791859847; x=1792464647;
        h=content-transfer-encoding:content-type:cc:to:subject:from
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n93SD5QU8DqBSGiig3C83fvSPXqJPhrmAx1Sp8NKSpA=;
        b=0v9dt3hGlaTrzyjWf60UCbD7dzXDjxaI6jW8gIW/4Ue8tUwNLxEqtlHAVQqdxuQ6RZ
         xTCd/hbb8lNvouqv/aaU3rgjlzHBvgOqf9RoQRo6NwwHjqixaWkAVlYtO6l3Q/r4UNeF
         MpHSQvbFDxaKb05jdWVG4weSpkQbeu1IEf1Z58GvGtUAgsUm8J/2bbDByHTvpWXC2/BL
         0x5tAQkSzi7qdVzjEy9YV8XL5EGvkx/wvODRklDnPS8s7E7GTsvrwTqOgl068oeoBD7m
         O4DQXBYERiLwhcRlULvhbIja8vdww1cEMhxwazcpdVRKd5604CEH68g6HFPQ1KH/glQq
         d/Qg==
X-Gm-Message-State: AFq9FYKiS8sCPEHHH6Djilmk0FEc+Q/k2jNbmUs1y6wS8gGtFC4JhNuQ
	eKyLUs+3Il3MvkJO0fXBeRjNBGkMuAt5VQmg0Hk2LNj+90CVbTys6Z1YvkML3KsRe0uStkq460m
	PCoqb9tgs4WRklIQFH+CPEhQTQnwngI5VFpm5T7aZD3vy2z4BA7me1VBUnEFy32LsdYP1Sn8=
X-Gm-Gg: AYBFou1KE27wNKTkaBzWN6mn8v9O9jL7e4c9k1AXXDpIKyvcwI5oU7S5t5LtpGN1exO
	WT7vbXL3NZezG7TivR3LJTZC53PKa/6hz7FIvtaaFXTxfUuftdcifoEpVxNvwPMT9+oDL/t2pl9
	Z63tMXxfOUB4IcTL2jZHTbrZfs6SZ7sMgnJ2b/2tNsJRRl2dMk1STzfhLikRmeDliTFu3AUPai+
	3U4ATvcSeltLbdn075X9g7M0931pF0uP/3ev4DY2tjrigmhcQWh7r0xS0i3DCMoQ0wArrXqyCY9
	t9u51sjrnWuGBhoMboBjPDnlIce6FvRIkGZkil/n2lg9OJBhicdC6xDn1PcaykOJUCseTkqIPwX
	g/l+cd5z77AM4OKcelkHKBKJ6wDLu3LtKAw==
X-Received: by 2002:a17:902:e74f:b0:2e5:d2b1:c70b with SMTP id d9443c01a7336-2e842e07b59mr95906145ad.60.1791859847050;
        Mon, 12 Oct 2026 19:50:47 -0700 (PDT)
X-Received: by 2002:a17:902:e74f:b0:2e5:d2b1:c70b with SMTP id d9443c01a7336-2e842e07b59mr95905965ad.60.1791859846555;
        Mon, 12 Oct 2026 19:50:46 -0700 (PDT)
Received: from [172.20.10.11] ([106.192.32.59])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e8c9sm48819515ad.23.2026.10.12.19.50.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 19:50:46 -0700 (PDT)
Message-ID: <6071a402-62a0-4b31-8b27-8806236d7e6e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 08:20:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Srikanth Katakam <srikanth.katakam@oss.qualcomm.com>
Subject: qcom: Update qdsp6sw firmware for shikra platform
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: dbaryshk@qti.qualcomm.com, raghukan@qti.qualcomm.com,
        rajup@qti.qualcomm.com, kbajaj@qti.qualcomm.com
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAxMSBTYWx0ZWRfX1CNVOH29e/4S
 MKqxlwkViWozl2CFN96XUTyX3P3+bHY9YBv/JpnqjrWJBLm+LGFgduEvYsXDB6vLCl79qq64qce
 Gmo96kyOYeWg4kBRDgIdPEbdG+U0NUtyAkuu4EqUwzuI7LU9VbD2Qo5/NowXE5rpaneC5bEMry8
 LwiOcCvyltsYTVIdyhoRh5+NyEEkpaMMPBAsFClKbCnZBnHBPXGZcboqWUU73B2HloyfIok1D/S
 bLeMYtgVOM/0unvE1RQal2pSoXSIuOfQxmqzaBZrizZy+qI+KauFpD+SenOUH7rcnnGv5EsMFM6
 XfdJRPAi8WA52sXUPz3xukyPO7s/RuATf1SSB1coog0iCMume3wk2fLJOYx+hAqwehOV9FZ0SZE
 eIc3J/n6OrkoF4wbrjREgEw8tgk6iSkE7nMBXKtDVHd47jdJe1aLUj1eFoWx4a+FWAlFgVmU7QL
 8xDkZik1kt2nMN4qz8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAxMSBTYWx0ZWRfX6xh4CSAor2XJ
 cNw3admclLyJaILeaWjdPzJj3wyhaJBWJ1t50nU+ioiLkq7wYHM5X0eAX0O67A3K1Ovv4S/7bgW
 c8oQb/OvBFi8VurKSJBQmIzpLgM84Ik=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acd9c87 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=EyhK3IwAJx65dYkKwG+mCA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=JDxLBrX2juEPc9gMfrAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: x3KOG5ZfvL8NdZfE0Kiby2SSVdo1rooZ
X-Proofpoint-ORIG-GUID: x3KOG5ZfvL8NdZfE0Kiby2SSVdo1rooZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130011

The following changes since commit afabaf773c4c2e2c841429933a6a084a5af4d14d:

   Merge branch 'robot/pr-0-1791575572' into 'main' (2026-10-09 21:10:55 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
modem-fw-shikra17

for you to fetch changes up to bd6f0a206fd33a9f507f5aea181262c898e6c18f:

   qcom:Update qdsp6sw firmware for shikra platform (2026-10-12 19:13:12 
+0530)

----------------------------------------------------------------
Srikanth Katakam (1):
       qcom:Update qdsp6sw firmware for shikra platform

  WHENCE                      |   2 +-
  qcom/shikra/cqs/qdsp6sw.mbn | Bin 5709176 -> 5668216 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)

