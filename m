Return-Path: <SRS0=iZ1L=BG=oss.qualcomm.com=wei.deng@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F49F0180A
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Mar 2026 08:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A45E4C19422; Fri,  6 Mar 2026 08:25:33 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B84EFC19425
	for <linux-firmware@kernel.org>; Fri,  6 Mar 2026 08:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B84EFC19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62654P9q4193475
	for <linux-firmware@kernel.org>; Fri, 6 Mar 2026 08:25:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Q5trKvpxRR3J6i2N9QNhXb
	KMhhdBiJnoDrGG9qEyQ1U=; b=Ki+/LBk+/Bi9iSsCVP+r+E88jI0cdiN2JixBRq
	7mISzbE90vZHm7eeapYRt4LttoAy53g8wbMGc5Ug7Kqwl0CiPwA6YYVoqkRGA6M0
	CC0ypJcaYYO9M+p8kgwsDhwXCH4Lj3rRynq9EwMGCI7YBt5fniuHca6iCwRbp3I/
	yNfWGwWJyxqM4t6FmlUbV5wT7YbvuBsa/aNx1K3LyEc5m+wgndwOBvibgwFxhjho
	IP1Rw4wp4ZxisYmz00sgpBTSmvyppg36qT8nOI+Y9DEOcslbl+wp3E1iY96UYN9r
	ASdfxRQT5YSf1bXGn3gxi0NELCURSDhkTsHUoT0c1BpDhFMQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5rn3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Mar 2026 08:25:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8272736ddc8so3384797b3a.3
        for <linux-firmware@kernel.org>; Fri, 06 Mar 2026 00:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772785530; x=1773390330; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5trKvpxRR3J6i2N9QNhXbKMhhdBiJnoDrGG9qEyQ1U=;
        b=aRBXacmQeadIvQD1NLTvpOoRO7S3BsKrM/MN9ijXCrYYwxmi8eN3E65So0PHIK5dJc
         TUpDUyKMP2TBtnMaTc1S0r1P7wF091zWiUqZYZ+F3O0U35xE/FaCZK/pFcZFmG2881Kf
         kqzyuS0d4U8sIq2SglWuQQInPw9VdnC/2G6gbXzy3wdzyDjjfpB7ojqAHaK4Rd2cM6WY
         T5U4ffCFcKly1+eckwXNnLWfEZ6A2gUGEK0dwNi268Bn6eobO00ZRlCTglSe/5MKf4Bi
         WfP61qdU6fLlKabIgtKGpeAJaq0G5Mbj5thWBlBjpmYRV1meJUptIgb5wNtzGlSoit49
         bJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772785530; x=1773390330;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5trKvpxRR3J6i2N9QNhXbKMhhdBiJnoDrGG9qEyQ1U=;
        b=WcruXt1n8HHw0dvurDQJftAqPY3Qxc9dx8oXvW0eo2ZveZ4swWijiD6F0gaphlDMRf
         bDR+zpV7G2byHFFVOoIInDs8H3OFxicKP29abjCf/K7TGErWFaUT5iGA8R0oJSYrXCCz
         poV24HdMfb+t0TjGqhcktAnE6ZTiwcJJ96QlwQAAGTm8wh8T/OsSkLIBKBYevDzpi5cL
         BmfXN4j/IGF7NlIXay1CWwmaGL028EXpzM+aDPdet92f2Gl1LCYf2onYiHnwAU3FNa+Y
         KMi64fsvnlhq7D1S/mUgqSmwMotBTQYI75ZJDUOeLAkWCJx3Vu591cFnoO/hBgMoSeLa
         XPkg==
X-Gm-Message-State: AOJu0Ywl+U+xy9ipoXqtp/neI5QWDKZTkf7KAQwmVIoz7r06pSa5//iF
	VlkqKp14C5VJhoC50wKw/dHQpfE+ChuTqSK8/0HUOnJYizms1ucEunaPdve5jkur1do6gPJi909
	MDOShb/2/UA8TMfQxTba72nLQJCPZfliYdEabsclmp+Y8yuXhpSZE+RIwGhFPZG3cBZQS00Y=
X-Gm-Gg: ATEYQzyeXl3NAfImkQePAwT/03IbBulQQUvDrKiZRCDk6F9SJFZezF05AU7mziHrnLZ
	Z1v6v9g9tSHOWXhDOU/g87Z0c8AwgPltzBF3wAYSOq8LngtjNiFJsqFdtn0uEtIVpvqoujRI+JD
	sxzNa+ezyI742IwKr/MCBFfFAplDwRlmXDOaaIH9VxrJj/awldNpq3dsoEoUkaKZ0R6VPVQtD5a
	m2FXPWsMELPoBaBbQf6Z0EkCs6ejqdXPvxkvy0gy/VcFWouOf18NAy70dnMKylSB7xixtj8EZbA
	G3geJXI41duNOz+r8YNaMoBLKLNyUw59wyBEMR8vE55JLJY4FnMmFoqeTDvB1D0bVEWMtJDPBDo
	7DTMm9zGzTrdTDe9iW6Rl8LApmsMxADAFV4B/D/jp23Eo
X-Received: by 2002:a05:6a00:993:b0:823:244f:1fa5 with SMTP id d2e1a72fcca58-829a2d45725mr967428b3a.1.1772785530284;
        Fri, 06 Mar 2026 00:25:30 -0800 (PST)
X-Received: by 2002:a05:6a00:993:b0:823:244f:1fa5 with SMTP id d2e1a72fcca58-829a2d45725mr967410b3a.1.1772785529819;
        Fri, 06 Mar 2026 00:25:29 -0800 (PST)
Received: from [10.253.77.103] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4656f43sm1404737b3a.16.2026.03.06.00.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Mar 2026 00:25:23 -0800 (PST)
Message-ID: <164b619a-2991-47e3-bcdc-e94d99ed98c2@oss.qualcomm.com>
Date: Fri, 6 Mar 2026 16:25:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cheng.jiang@oss.qualcomm.com
From: Wei Deng <wei.deng@oss.qualcomm.com>
Subject: [GIT PULL] QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00069
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: XubH_YpLioR_IWd7D6jfPAc0FF--ZJx4
X-Proofpoint-GUID: XubH_YpLioR_IWd7D6jfPAc0FF--ZJx4
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aa8f7b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NEAV23lmAAAA:8 a=0mdM2fE6pLMNhOKXb_wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDA3OSBTYWx0ZWRfX3ofl5amc2as6
 1t0pDt2x+S2lyFUTIeeTXWALqmkwhwTG6UzFdbWW4ObvuJbxg0Rrk1PdSshh4pxm/vcQCGi2s9M
 1GMfh60jfEqXkPyXRL80TG6RmzYHT/iygv6MHJEGRmRuQHgR8wM9R+jQkIGwXoG3jRyENQudsl/
 XrcCnIDQMHJdW4aKv+Ef7Pv8XHv323DyXlug+yb9jJZg0PgQpRykaQVEMg6bib2TE/h8tvRcU6M
 iXiO8yaRhmm4vqoIOA55SQIlP/3NlW3/kNCUOp5a5qwCKDgJdazcmf0VN+LCWRhgsSyWjs2CMLg
 /+vcLIFZLmAsHic2fFFHDPIp7wYCronaVifAZ9DdbBqHcWjtYw8eX92MPRXrhVW78CI4imSEla8
 1AYO7FPNpbuJa5m/sMPV3ALh7wIMxtVxOOisKsePmQTJIlhbxebgYLwt/vf0V3TifMkC2CLGWNl
 d+/qCSd8ebJHt9HFxgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060079

Hi linux-firmware maintainers,

Here's a pull request for btqca bluetooth driver. Please let me know if
you have any problems.

The following changes since commit 7d2b4c758cfd02c2ba1c807f234c0afc308789e5:

  Merge branch 'robot/pr-0-1772726739' into 'main' (2026-03-05 18:17:02 +0000)

are available in the Git repository at:

  https://github.com/WeiDeng-weiden/qca_btfw.git main

for you to fetch changes up to b251087087e8a2fd8b1b2523a66286048f3626bb:

  QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00069 (2026-03-06 13:08:59 +0530)

----------------------------------------------------------------
Wei Deng (1):
      QCA: Update Bluetooth QCA6698 firmware to 2.1.2-00069

 qca/QCA6698/hpbtfw21.tlv | Bin 161716 -> 167212 bytes
 qca/QCA6698/hpnv21.b206  | Bin 6614 -> 6656 bytes
 qca/QCA6698/hpnv21.b207  | Bin 6702 -> 6744 bytes
 qca/QCA6698/hpnv21.bin   | Bin 6614 -> 6656 bytes
 4 files changed, 0 insertions(+), 0 deletions(-)
-- 
Best Regards,
Wei Deng

