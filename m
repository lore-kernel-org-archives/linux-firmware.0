Return-Path: <SRS0=kcia=2T=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA8FEC87FCF
	for <linux-firmware@archiver.kernel.org>; Thu,  7 Aug 2025 21:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92801C4CEED; Thu,  7 Aug 2025 21:43:49 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4175C4CEF7
	for <linux-firmware@kernel.org>; Thu,  7 Aug 2025 21:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A4175C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 577IABE5007839
	for <linux-firmware@kernel.org>; Thu, 7 Aug 2025 21:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=c0YZ3YLLvJK2KdMo7JoUSc
	JunUE/MEJzmwquZliu5aQ=; b=AqxKqiotMaKj+4zPmQwOMwJzOt7NovA+3yERsn
	2jguwNczw02rJtEEJde29DyHMD0mAuCqxP+u1ExQzuw5QRHKwAoceNOTKTDIt+UR
	uR3vooaoJwNdCknLTzfdz9xYKvAo5A6Q7i/b0YSldKWxcZy7G90yxCv9AvfXCmaf
	pV5F0gquaG7oBzieAjEVCCx3oVwoHxlTQZEybgegEbnEI5//nwKedhV/HRoSji+2
	qMzei8F3g0VPqkLRNNTlt+nqpQgLPQ/+GZrOgwg/MQo1037oQdyiyodmQhfEtIoM
	ReYSeJyPcaPY7fwFmS1y6ag2RsWqie+3c+E2rBAbd8OQEsuw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpy6ytd6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 07 Aug 2025 21:43:47 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b423aba05feso1409139a12.3
        for <linux-firmware@kernel.org>; Thu, 07 Aug 2025 14:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754603027; x=1755207827;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c0YZ3YLLvJK2KdMo7JoUScJunUE/MEJzmwquZliu5aQ=;
        b=enx/le4bsIMUXjZIUSJN4HoKKlCu3jIArGJiz/ECPa4S5LcCaub/TTwBcQhRzjNYba
         NlvzJYbPe2c7wyD9DFs7TMCZdfnBtrS5UQa2wMlehcKjPKRyTFKIcgUuYljya0Cq16ER
         7FS3RkIznUbWE8aOKGNbg4+KW0YbS5ms8wCKEuCaUCqzhXgoCK3AQWslT/Uul0XZByfh
         yb4ZGD/+r68dEDnNUJe32KTz3LpxHAo5nf+TQLssYELxt47U948IHMpEd6eVZfHaTkSG
         y/b1yQmUkJvbswFkg4bAbPbmZjzBw2+jaqWLac8pO5vhoVqEAgayGlxk6PF7o63di/wq
         Jc0Q==
X-Gm-Message-State: AOJu0YxLb8OqNhxHU4EuDTqZdeLdwwDzwJpZMVl+UaDOuRu6TIGuzQlM
	Wz9eorm1GeOF/EDgZg2ghTreWSgLj+e5XI3okycDSjljs0ROQgWsZaKa3hMA6gqLGS38qESezrV
	pGnqZhcqO1N0iGzpZaKPersvHJfgVwvJW2go93J64Gt26wpMd2g877pisTWc9ZOhwCCzXHQw=
X-Gm-Gg: ASbGnctC3+nb/ZXJ2JZ3q/6mzs/IMoiguqfEJeRaH0ABo4gFOp5+f3+eUGu8y6QjcBY
	XdYkL+aN+sycz3RqQzhT9/zHCP+nGMGYgDExad5uu1u4BERHgtSHHkBRKnDeNEIyKOot+ofbLDr
	M/oA5jz/7CKpn5drbEwvyQ74koxnED1w5oPs9plqr6pdxv+LBoWGlpf35i+duoE70D9fWCTITys
	Som6HjouqvaOx8n1Cv+RmG/8zCMjHISpBkdDN8xG6/YchPdCpWV0Ow2H1HQLEVYF1QGr4vm9bhJ
	3NL7TXE680NdqWx9LbO/4ORkWARcpNzbiG/YOZYUe/sjZYkp89GWPcC34m5b57WtjuHUZN5zRHJ
	7
X-Received: by 2002:a17:903:3583:b0:242:8a45:a95e with SMTP id d9443c01a7336-242c203d43cmr8131705ad.15.1754603026841;
        Thu, 07 Aug 2025 14:43:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFN6v2dbx8Buiz9mLDddezvlVyeMzN2wDlRLGfDM+oXmOvFCIoQRzS8Xs7yecMOzsLJVhDisg==
X-Received: by 2002:a17:903:3583:b0:242:8a45:a95e with SMTP id d9443c01a7336-242c203d43cmr8131495ad.15.1754603026374;
        Thu, 07 Aug 2025 14:43:46 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899a917sm195015435ad.116.2025.08.07.14.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Aug 2025 14:43:45 -0700 (PDT)
Message-ID: <6e3e8199-814d-4969-a951-d6b60f60257d@oss.qualcomm.com>
Date: Thu, 7 Aug 2025 14:43:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath11k and ath12k firmware ath-20250807
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sM3K2ffJkajHa0f7yxMrVfZ-jSxD3pVG
X-Proofpoint-GUID: sM3K2ffJkajHa0f7yxMrVfZ-jSxD3pVG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX64mkbCux4OVc
 yCOHQaWpZKWSAbh9dx7+CAPYgAJi80ilCGHw5Z09NFRFlkdj+FSoKImrDsa3KofEAQ8eczVI+Gm
 xJES0gzYu+Dta8pKV2c7tkoKkcZ6Qc1ZnlQNoftl3vkYW1Vl/3tRHD3Y/tpAeIljsQ0y6l8g4IX
 Mu5gl7k1y6uzdfLjkvXMi+REbXQhU03qr6VwHlsXpXGMGNTZAZnQHIwsyvJpTeBkvfu0k0F92aP
 1WfhvK7EOCKWS6ZetgFqcT066kFzKrpyijr4iURth9cCodYIZg7lVE+kJCciLWJBTz6H/+k5juw
 HWBahaTvVD+612ZVTagAQKUx8jklCBeiIdpLWpy2s+aDH2kbAOuiEe+RXKAwT97ZupC1XTlCc17
 zD/CgtZI
X-Authority-Analysis: v=2.4 cv=LNVmQIW9 c=1 sm=1 tr=0 ts=68951e13 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=8Juthw4_Jig8fID-B6sA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-07_05,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060009

The following changes since commit d30c7b425f6d9c9e9f54bcafa99b375342b3a774:

  Merge branch 'robot/pr-22-1754588181' into 'main' (2025-08-07 17:52:32 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250807

for you to fetch changes up to 35abebaa15c1ff1a141b7c24d79220ef70f48548:

  ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3 (2025-08-07 14:32:02 -0700)

----------------------------------------------------------------
Jeff Johnson (6):
      ath11k: QCA2066 hw2.1: update board-2.bin
      ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_SILICONZ_CE-2.52297.9
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04650-QCAHSPSWPL_V1_V2_SILICONZ_IOE-2
      ath11k: WCN6855 hw2.0: update board-2.bin
      ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1
      ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

 WHENCE                              |   8 ++++----
 ath11k/QCA2066/hw2.1/amss.bin       | Bin 5349376 -> 5349376 bytes
 ath11k/QCA2066/hw2.1/board-2.bin    | Bin 685144 -> 745408 bytes
 ath11k/QCA6698AQ/hw2.1/amss.bin     | Bin 5140480 -> 5005312 bytes
 ath11k/WCN6855/hw2.0/board-2.bin    | Bin 6429240 -> 7056532 bytes
 ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15392824 -> 15183928 bytes
 ath12k/WCN7850/hw2.0/amss.bin       | Bin 6078528 -> 6082624 bytes
 7 files changed, 4 insertions(+), 4 deletions(-)
