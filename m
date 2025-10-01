Return-Path: <SRS0=QCDN=4K=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABDDCCA470
	for <linux-firmware@archiver.kernel.org>; Wed,  1 Oct 2025 11:39:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 663E7C116D0; Wed,  1 Oct 2025 11:39:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9515AC116C6
	for <linux-firmware@kernel.org>; Wed,  1 Oct 2025 11:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9515AC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5917nfPB017574
	for <linux-firmware@kernel.org>; Wed, 1 Oct 2025 11:39:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gAQYezA0PXT74WN3XzrzHC
	fE1vxB7nqR2zANhrSfcvw=; b=JU470z9o1+ratSXc9ncGZZXRo6cqaJ6P7uOT66
	h6UTJPtnwO9J1aejU2KYudcMF4zJ6b57aUIl0Pb/D+ZydUJV6QDRQbz5cKnC7AcO
	k7exTksOb0cSIXtq792TOJsXTQjdIFKFqy+0SfJcBEqqPIRDSx3zjdmGA5gjVYve
	xkA2nI37V51BLFo5nD4bS9tWScJ2Ki8xO89nVYqLSgwSHnFXrN/4Z62RLYqN0Nen
	NqtZYBQm17po8oQdI1NdQbN1RJafrP1jO8Tftzqq+1odheV+/yHv7Xa6z4NjojP+
	zCDywXRl3HVsbnkiouR/IRdy0QelzYeoZ6bIfiPlIYukvKkw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tvkkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 11:39:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33826e101ecso920447a91.1
        for <linux-firmware@kernel.org>; Wed, 01 Oct 2025 04:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759318782; x=1759923582;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gAQYezA0PXT74WN3XzrzHCfE1vxB7nqR2zANhrSfcvw=;
        b=Op4ajO3T8792dUwQubgYoW5qRUFz0v3MTxe7bkefA/STTEkz6UacnQK3eijbL3RKfq
         PRdb47XkUwzMH57bHfj4BxP0PaVObYVXSCCC1Gj1HPj51NTzwRKAGFD/Pc1TfJLmpT0K
         QspcFozUtS7uT20TOOJCSlVQAFJPMWSyZbC56IpmgFWdyfUX98kGeXhfQn8nay3Uy9Tj
         xNn6uu1ADoc+MIhAlnUZqMCiJJg4g6YgLrK2zXnbLxLRsayjY8gv1rNzMoNGTdWDY9tz
         1e2t1ZHCDOBidmAsUqMe5P7kwwpeHeawsiPtis7GRfF7nwtmrGyMoi9rjvNuCQSTpSNX
         81sg==
X-Gm-Message-State: AOJu0YweK9qCOG0PUMHLH88RN5707tDDbqxPZqN9lNj+fkfosKiCKByx
	z/PpH/Eaym5HVm6TzIwTDf0xFs8io49iFwnswh/9HGBoBOPJ9jB3CdK1DTBuh3G6KiMo8dzcn2k
	fkE9PRB3Zc9OIArqFgk3x0mTP6+r1zHec+mkZk4blTHFYH3OpM3SDEwWLi6KDsAf0LTxJmTU=
X-Gm-Gg: ASbGncu2LQnW/auFRDOowRbUJSlkYdEeCuJdxkPliMLcACRqnnYZOqSmbZaTZGmbAG5
	MW8wld+SmO4u6LRksP9x6tpCbMRShb1vOulGVckgMn7mWTbg95leXcLoeCLBiIiRhnS6jm66HWx
	ktxGMF2UhiUL7z5W1njnKpdAheevGOm31QCFMVhKQHPU9C5L4m68hccPGegXrFcqJwEJCrPpZ80
	NItnfMx7zwalnxFtV0Z43gWSdS8EMW/X0iyHahaGP69cgOw3USx/EJ3H7n/vjOlQpzwUZvSkTQ8
	tHl7ph6As7MMY1yDELsnPZxf5k7VBmS51tMBW7VEMolwcN07IUbBHzB1tLZsrAMRsRTiJuenR/+
	PmTs=
X-Received: by 2002:a17:90b:1645:b0:32e:72bd:6d5a with SMTP id 98e67ed59e1d1-339a53c0d21mr4038059a91.1.1759318781954;
        Wed, 01 Oct 2025 04:39:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNHIEQpDrjrZAUO6OWZdMLqU1OwraQfl2MVH97GdbBSR5jXj3l0UGaBWzFqfg15BN+oD8Ljw==
X-Received: by 2002:a17:90b:1645:b0:32e:72bd:6d5a with SMTP id 98e67ed59e1d1-339a53c0d21mr4038019a91.1.1759318781438;
        Wed, 01 Oct 2025 04:39:41 -0700 (PDT)
Received: from [10.0.0.86] ([106.222.229.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6e9d22bsm2178636a91.3.2025.10.01.04.39.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 04:39:41 -0700 (PDT)
Message-ID: <ff27f712-a96e-4fa6-7572-a0091537d8ac@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 17:09:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: DEEPA GUTHYAPPA MADIVALARA <deepa.madivalara@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: update video firmware binary for SM8550
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX9COY/PIcqelA
 aAgV+k2EU/0DlW006zcq2p21coBruG51hU+pbFkm4RQaF7gOvbsAF77Oly0BzWKwC/esAQ9tp0I
 gRCuG/W8Iag6p6+JPo/TtwSpS9ZKAfOP62LPf+0wLiYY+04E7Siedc+99IKt2avJt9EBqSDT8vI
 6RPthoWf5NYHu9gz9AXNJMNT6kMPotub1xsdzjUzsc6MXv0QiRn2jai1UYkUZMZiD1wdJGRuMDi
 PAw9jMCUH6NNjEfKs2jJtcn0fravb4p4F1u3fTPu/+rUlmW9ZDVnHIcD6kLrCFW/+xgaagRmi+j
 rHUfJ4008+alUSmTY4WU6Ach7jfkfg+d7UQ+e+WcHMZ5CrU0qW9NY48wiLVuzmBxDz8Lolivn36
 REEHbu5uS4zMqCR/Jr4x1l0yoTbBHQ==
X-Proofpoint-GUID: K_OWeFbucughSV3kTYPgesULqUpRUqGu
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dd12ff cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=L4UNg9I9cQSOxNpRiiGXlA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=qC_FGOx9AAAA:8 a=LS22gsGrlcL5njcvvMcA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=fsdK_YakeE02zTmptMdW:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-ORIG-GUID: K_OWeFbucughSV3kTYPgesULqUpRUqGu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_03,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

Hi,

The following changes since commit ed924f6db3c973f941fd6c6317c0d52664e83e5a:

  Merge branch 'robot/pr-0-1759253351' into 'main' (2025-09-30 17:36:46 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-sm8550-update

for you to fetch changes up to 208c760dc79677e0ab4fa596e23e4dd9394e00c3:

  qcom: vpu: update video firmware binary for SM8550 (2025-10-01 12:14:09
+0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: update video firmware binary for SM8550

 WHENCE                |   2 +-
 qcom/vpu/vpu30_p4.mbn | Bin 2323048 -> 2323048 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

Thanks,
Dikshita
