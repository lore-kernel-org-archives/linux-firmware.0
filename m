Return-Path: <SRS0=lI19=AI=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61018E9D41A
	for <linux-firmware@archiver.kernel.org>; Wed,  4 Feb 2026 17:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32759C4CEF7; Wed,  4 Feb 2026 17:18:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67807C116C6
	for <linux-firmware@kernel.org>; Wed,  4 Feb 2026 17:18:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67807C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIWwk792900
	for <linux-firmware@kernel.org>; Wed, 4 Feb 2026 17:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8opFdOz/tc1NxrXdMT7CER
	6PwqQ8gtJ2RmFX8c40zGk=; b=Ks9sF/V2fez3S/ZVEalIMMMix3TE4RWWsl4hye
	GeRpXhA27IIxmC/RPeaKrw7r6YctIzFMAE5/LAgIjksA4fEBinvshUEW3pknapMi
	08NQU4AyK8pfePH4ICxyQ7UmoQws5BbeQ2oHqY8/jm7ZxWyKRPXd9t7sFjjcKSz0
	v9sP6d+cvEfedSYM8cqFwK8Bnvr7rsmcZXw47eU9ou3jHdHeegnS8i9qMG/CBdnc
	Q+bh6H2jL67g38xbdPJzjw2VZLCrhVqmWMPVmGRSXcU1whLN2IHmw6gPXJWj8LgB
	hSNQmq2IhU4AmFKg6UwakbVY+BHYDASfg5+sHQIP32HWSNsw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43uxhdjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 04 Feb 2026 17:18:06 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b8343aa8a9so1088724eec.1
        for <linux-firmware@kernel.org>; Wed, 04 Feb 2026 09:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770225486; x=1770830286; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8opFdOz/tc1NxrXdMT7CER6PwqQ8gtJ2RmFX8c40zGk=;
        b=OnglxTpWcPCnQfRxR+qohxwfQv824e3HJ76ejy7f6bmEE3udE+8ESqAXUT4Rchlm6S
         FlGp4hko4X/l6nPpH59a3lplqFl3Io3S2Zfe9Hz4FQkrbr/bH77eznosHvHNGuBBO08Z
         iShSTm+0jRCB1uR+MXbgaUKPKCNIaD5CQVmY13ie5x864OHTRwaYGmUBWh6HtgDMLKyH
         4QEgkg/Gqq8MvrouAEX2jz6SXe5XBx9ktU6Hychd98RFbwsXec/m7wZCMos2EqzIiiMF
         svx1WThhyRP0xte1+gUhLSkt0pUoIdIZxHtz4yPardwvpXkoFRNZFRmkkjPtEEl/r+zS
         fXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770225486; x=1770830286;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8opFdOz/tc1NxrXdMT7CER6PwqQ8gtJ2RmFX8c40zGk=;
        b=YyNKS2dBNFThoxu6CKK/1T3cPL+pFundiJoaWrMwrPG3Cp8Rotm80UXOE+f/BYficC
         QgGeaeGoRzMSV1SmyfVUiiRjiGxw0jbYTiPw94hW/xGWBBhPgNmDgSS78DqlrTwuIJ9J
         TvzwDgTVTA8Ly5BlKo9EMSPphM4jpc8zzM7kY1Q4IkKvQRxQV1w6KInIWUkVjjr2heFL
         jKyo4S0JQzUIn8x9LDrj51PEHFSfG1opEGukwO12aOnf3pSjnjhHunzeF5PXsrS/UQMv
         XWWV4no0qPRmsaxvTUfIngDwsBGoCdMvTeu+qrKnCq3hjHynxwp0k1qzEGdn7JgmXm2Z
         Q+5A==
X-Gm-Message-State: AOJu0YzyR4zWnD1i6fHcUaggvceucsjCge8ydRnbYFE1Sq2scou5YOcA
	XcYrFp/GAkuCmd9QcZNjj4TKRgyRnUhtLGbCNce/YSjfexOJAOezr+I2ACa2964vh8kzXQssh/I
	MG8apV8qsVpSlAkdqbPI5xeMooYY0aORdBDNrR+KA0tbXVWw7ztg8JGIMZI7KQci1I+qAp1g=
X-Gm-Gg: AZuq6aKF4T5xHZqdcHaL1FFqZtqF6VHyeugFyiTJabkNSUX7DqgBNCd4LE7LQHz/bp1
	Yq84Euq57aKnZaAhMbsjm6XqQHj32m3OUaX6TZuJoEua01nTU92mC/+3guAkcJCo41Nuy4RgYnW
	HeOjhrQCDwUF7Eb5kAkVd+HbYKhVAHS6RKbJ5inAGxnxylxVz6vrZWeMm2o7zfs65v/XixBezh6
	SY12JeVs52jRgCn7virxTB81RDHBHWpd0936bMIGJdX5+C4G07rLo9O/UWwTBJG5hejOTfinmOd
	3+mFdoZmwGXP+K0ewli70G5RmyMoPhocvQRov8tZOj3y1OtBIms9WpcxZWoim82O0FpWb+vd6+V
	58jL5mqnuZUvJ7C9Rk4482lPQbXy8iv1qC9WqZn05BOmFYg==
X-Received: by 2002:a05:7301:1008:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b832919b37mr1535421eec.12.1770225485601;
        Wed, 04 Feb 2026 09:18:05 -0800 (PST)
X-Received: by 2002:a05:7301:1008:b0:2b0:56fd:4b67 with SMTP id 5a478bee46e88-2b832919b37mr1535405eec.12.1770225485029;
        Wed, 04 Feb 2026 09:18:05 -0800 (PST)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-126f5030e22sm2490537c88.10.2026.02.04.09.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:18:04 -0800 (PST)
Message-ID: <18adf454-8e66-4b3c-a6a9-81faa2c57602@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 09:18:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260204
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=StqdKfO0 c=1 sm=1 tr=0 ts=69837f4e cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=DW_G4QuS8ySNF3ajTrEA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: srEp6aodHN-Dj1AwB9mSpOuoTxCooX5u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzMiBTYWx0ZWRfXzhBBp/Kdt0Jx
 gQOEvUGkB+ZzlwhRwz3IUHWT1Xe3/R4e997GA6w+4TIeuyvIEXE987LsLcQcBBFnEAb4EJRTS8Z
 90ZJJrPdKgOUd+kqivwecv9gJsgmfiCFbMF8PF1IF/F2IGNDmkPRT0VIpF/htBKeZ3vv1Zx4pcK
 soNHRkSHTdnlBmXzPDrOgPyTBmYUjsioaU5jV60++3exK9T177p3cLfDWtD+zbQe4FiECbwJ9bJ
 TsF4/1ZQCoHOWoPxhgcGpq34rI5GCjeMbt+jpNu5ELTT51V2c8Ktd2ZFTLrlQEuqSZH3ZfaIwq8
 PYDdno5GQOtTaOcVFWAIW2maMtIB/iHWrMzI6Q03Q6fJVPYTQkGQX0j8+LxAeZs6hPuQn9YbhLv
 ZkeqB6yKyzFTRUBM+g+Xa0J3etOnlexjzFEUpxJ8oTerudw+O/wdJ60xqpxrsq/4AX7EY6wnNYX
 gSJ69Tu/L/m3oQlrr1g==
X-Proofpoint-ORIG-GUID: srEp6aodHN-Dj1AwB9mSpOuoTxCooX5u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040132

The following changes since commit aeea3bf80600892be582a61de1551cf431341d9e:

  Merge branch 'robot/pr-0-1770184708' into 'main' (2026-02-04 09:13:00 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260204

for you to fetch changes up to 81a99dba039a21fd83d37a67a7de0fb80152e065:

  ath10k: WCN3990 hw1.0: update board-2.bin (2026-02-04 09:09:43 -0800)

----------------------------------------------------------------

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

For ath10k update board file for WCN3990/hw1.0 to support:
bus=snoc,qmi-board-id=41,qmi-chip-id=30214,variant=Qualcomm_sdm845hdk
bus=snoc,qmi-board-id=55,qmi-chip-id=30224,variant=Qualcomm_sm8150hdk
bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=ECS_QC710
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_blueline
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_crosshatch

No updates for ath11k and ath12k.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/WCN3990/hw1.0/board-2.bin | Bin 742192 -> 867116 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
