Return-Path: <SRS0=gkXG=6L=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2482ED33981
	for <linux-firmware@archiver.kernel.org>; Fri,  5 Dec 2025 16:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7819C116D0; Fri,  5 Dec 2025 16:30:07 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF5F7C4CEF1
	for <linux-firmware@kernel.org>; Fri,  5 Dec 2025 16:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DF5F7C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5FBMvx1077686
	for <linux-firmware@kernel.org>; Fri, 5 Dec 2025 16:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uY/zz/FmTheKinzMsruxPA
	eAFgeFSh6MXrbrP2Vw8Ck=; b=AmewZFZuTpnfOwXbHKGEFposUfJyFi+9L/sM1r
	dSP3z8QBY0s66WGN4QyK0LiJWmXsSTQKVNyoVvL4s1MnLL1Rhj7gRAT4lNs2nURK
	dXHXbwhxGEmkvjv8VHTbYeo1HDmUf46r0p770SoRRFiX5mGiFt+xObRaXGrpEgo/
	CnIpWfQmW+Sgv/N5Ch4PPntC5ALF1km241FZ0pnT1Mk+k1E3nLSOj1W54UjHiUhv
	6wxXjP38eeyJj3JO2sFOcSCJadq8QQECu5O9iFXzot9W7jffAsdqNyk0UiBmYzZh
	gqmSJhtxjEUoF3w2O17fdLobl4KIkCGudqsdbL45Ahy+TH2Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aupa8t9g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 05 Dec 2025 16:30:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2956a694b47so29067045ad.1
        for <linux-firmware@kernel.org>; Fri, 05 Dec 2025 08:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764952204; x=1765557004; darn=kernel.org;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=;
        b=G9NXxakKIoDBPmEnvg8iBIHLjyE5Nt4JzZb0fV8Q0FD0OGLpGajQIXrIbMa2TkjLUE
         zJ7HDMEspMNQmfExPFzpvq7tekef19dzcoaRtAk7Aqo2xDUC9QHTCaGTT4WDnt8t/FFf
         ROmmoYUOzEV3ijxgumhfiC4ylT//Kf1un3hOnU6dZYhw9L+6LHF+8uJfoBHBE6L8ZUQ4
         l8el773gavcanljqIVVEFIuxU0kYogVktbt41ynm+MvHZe4UwLpOUCZsfaW7faFrZ2jd
         cUmtik+OKCeGCu0NN/tbU9EIyXggImN7IW2sm/0gff8aqFxImW6wTZnK4ep7z9e9cQmD
         oyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764952204; x=1765557004;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uY/zz/FmTheKinzMsruxPAeAFgeFSh6MXrbrP2Vw8Ck=;
        b=qH/rFBF+jIA1WDgKgM4fdO45zs3MVLEeQN9OU09pvi3dRy/byG8OPheUaY8Z8vGnkL
         rYSQ2xBLKK5dW1MtO3tsltqDLwRBuG0RMMFzNg7Unv1N49l/4sdaVGZBEizMEqx+ocC9
         ds/pKP+N6vmFHV3DD37GGUx9peRDoPPtlSjU+av60wGmPhdny25hZV5mVrXuzMrWuv+R
         qAEHMxSeN0WB1pvtlyXbhu9LJ519HkeQzOAO/38DLUReJDIEDygJnFYmGWCZLqD4Hxan
         vyu9nstQaH5/RV4CPk1VjI6hxS1UK/Q953OIov/LW6ungVU2Nrm51eDhJJLzo3e4KmGR
         rpPA==
X-Gm-Message-State: AOJu0YwWhQonsy4QIxTwVmQu6BwU3FAt0rxszaaGBHYwYK0NPp97CfMK
	7cXu4fP317f8adB6MjKzFATyKBGEs/u+m/O1Hqmi2F7JYRSB8BqUhHHeeq9E/BNpS7TLZvfjZYg
	Dehm4ggezn0jHF6kMzcpe7uC50O64bLuDTjZ2ppZRFB/fzS3Z714C+4pMhBsEB6Q3iTP2uiU=
X-Gm-Gg: ASbGncvfJK9ScOHDY0RalbCzLloz5OODtCCQ0jKqh+B+wfsZXwG4cFBNCftg2DTimDI
	nfCzfQPnEvsmFYLUb75Ld/7SQL1EVpXZ9OIJ4+WOoTdmiTB0G8hn+aurJGgrVfaQBksOjMTFrvB
	IBSa9816jKJKuo/0NRwlN5KodVTGVnLr08ZN8HQnn9Lt494YPC18PrmD7FYRdSHCIxz3x1DH0lp
	2fYecX6zvsQ3ubcFy2L5fvkti4wrGcyQ9IOn7w5UjJuYeM4bsG8swi8JRogEBJ7VdbqQw0I66LZ
	itPrMuhNhn0yNXgKPdzcFcRogB+2LqwBlPL1dQ8+EgFaH25nfoPP+m9G9PyJR5ScTx//YZY/fJa
	RZTnX6VnW7kYWiSLDnyecb6/E2hI7RqQpfF1YFJwXEHoz6A==
X-Received: by 2002:a17:903:1b28:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-29d9fb6eb47mr88186795ad.17.1764952204095;
        Fri, 05 Dec 2025 08:30:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFoqCm17nT0SnoxUP5EoDhHux+tD0gpH6iUAYDqqKgBNd2YHlT+I8Pl/pJ4QXlhgtjs1gu46A==
X-Received: by 2002:a17:903:1b28:b0:294:ccc6:cd30 with SMTP id d9443c01a7336-29d9fb6eb47mr88186545ad.17.1764952203564;
        Fri, 05 Dec 2025 08:30:03 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae33c2e2sm53266725ad.0.2025.12.05.08.30.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 08:30:03 -0800 (PST)
Message-ID: <f4e1e95f-672d-418c-9f3a-e47d01a1fe91@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 08:30:02 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20251205
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6933088d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=81yDGmwx11_j3xA_CzoA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEyMCBTYWx0ZWRfXykRyoCodCIGt
 cxuzd5T+Fw3y6LsM1rr8H4fORQkfXo43zLzoRpm5xDOmNf/RhPOiRMyAKWcq7qfIX3FfbxWLQMC
 WMbUFbBV5MDXre1EYTq4myjJnYF+CEGzAECG7t9a7QhcAg+n567VwuGzgirKYC+8uL8Er4C+A11
 J3ctYnTxHILacxLxCzQr1UUA/4vmQgoRH84dIqgPL7/iVVTjAr7CRUqnBfnBUzDJaw1hWVA8+U3
 Bq4EvtXFb892docsOzytO+TXZQk6TzGWB9AzVsc5UVh+xH34BwSAkC1yah+MCJxFRhLgSbNz7yA
 mdBMSdwxJHthxaKAovNokhuvDs87F3u9JNi243M+EpDrpx8CqTp3ivFbLO0TRSgkmlsQS3HR/g/
 1cj5wFjoEHHremGGN+UgB9gWOVoaTA==
X-Proofpoint-ORIG-GUID: 4cnbtrkY0KiJgom6W-SjNJOn-4TMNjh6
X-Proofpoint-GUID: 4cnbtrkY0KiJgom6W-SjNJOn-4TMNjh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050120

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

Only ath10k board files are included this cycle:
QCA4019 hw1.0: Add Netgear LBR20 specific BDFs
QCA4019 hw1.0: Add Meraki MR30H specific BDFs
QCA4019 hw1.0: Add Meraki "underdog" specific BDFs
QCA9888 hw2.0: Add Netgear LBR20 specific BDFs
WCN3990 hw1.0: Add board file for the Arduino Imola (UNO-Q)
WCN3990 hw1.0: Add Xiaomi Redmi K20 Pro/ Xiaomi Mi 9T Pro specific BDFs
WCN3990 hw1.0: Add board file for Huawei MateBook E 2019

Please let me know if there are any problems.

Thanks,
/jeff

The following changes since commit a0f0e52138e5f77fb0f358ff952447623ae0a7c4:

  Merge branch 'amd-staging' into 'main' (2025-12-03 21:05:40 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20251205

for you to fetch changes up to 05c97f71a5336854054db1dd4acdaf68c5b7c144:

  ath10k: WCN3990 hw1.0: update board-2.bin (2025-12-05 08:20:14 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath10k: QCA4019 hw1.0: update board-2.bin
      ath10k: QCA9888 hw2.0: update board-2.bin
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/QCA4019/hw1.0/board-2.bin | Bin 1822336 -> 1895232 bytes
 ath10k/QCA9888/hw2.0/board-2.bin | Bin 218596 -> 230744 bytes
 ath10k/WCN3990/hw1.0/board-2.bin | Bin 670116 -> 742192 bytes
 3 files changed, 0 insertions(+), 0 deletions(-)
