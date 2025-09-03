Return-Path: <SRS0=Yafu=3O=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9C7CA1010
	for <linux-firmware@archiver.kernel.org>; Wed,  3 Sep 2025 20:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A107C4CEE7; Wed,  3 Sep 2025 20:29:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8061FC4CEF4
	for <linux-firmware@kernel.org>; Wed,  3 Sep 2025 20:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8061FC4CEF4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583DxMcw030304
	for <linux-firmware@kernel.org>; Wed, 3 Sep 2025 20:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LXrcTy7G0WcV6Osu/tYiTb
	Rx7MyQDw5VIaQZZFiljHU=; b=Udoje8NFvTCS7UJX7uZAMSr3ASXQgQs6wweMUu
	CD+tp4g3ULUA57kTcsHbkq4jKH1v5RkAUCMFdZXYcUCR/PV7Xe7RIHf9RjEElWTa
	cFUYdFWWIg9Rtm+3H8lUz6HTRIIha8nD0MgsB7JM3FyPkq3yDrEXGVg4WBTcGkrl
	4Vg2iQI8+JY4besC1fK+w3EXExsfkXI9TAXWD0T5NUWgXcZCt14NOfBMdmMzjqwS
	sVc7u7Pph3UqPvrgcbaqJYmFKvZl3849C1d18fYh4YD4P5PpeetymZqPtqiN5Tk3
	YvK/dOJSOmcZsoNYlUvTKNZ9NDS7ohBBhF8rLLBa7A5FEZbA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpd83n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 20:29:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77241858ec1so266944b3a.0
        for <linux-firmware@kernel.org>; Wed, 03 Sep 2025 13:29:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756931367; x=1757536167;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LXrcTy7G0WcV6Osu/tYiTbRx7MyQDw5VIaQZZFiljHU=;
        b=DBt3EY2lUbA3Nr+p13zywNzihc6mrNd7I3q8+1OyXcS9xU/Br2PtBcFcpRetLi7Q+P
         Zcx5TZ0AUWhF6hPfwZ4/TjSFxqKPNgT1tK948JZoRGGCiKUP/E8LDKibCuW7hJPBP9nx
         ON406d7i4d1BgzvOJC918hpirxOZDuGTFh+c3H6btFvRrwqT60cgMGZIxgYPjYgyNsWm
         AbOXwMfAAQCVvXJpOPmU7KzWMfdjoGRE+yCRB/kmZ/PLpBnYcfu0Fqn/qWBJSnKLDd0U
         BCA9NSnU4WSDObVDxm6yhBRHOEio8E60GKcTnqwkB80nQHwnCIS/cPKItwrG0O8V3tyP
         xLpA==
X-Gm-Message-State: AOJu0YwKF5N1fWCDnoac3JhtdewoM9UfL2p1c1w2cFRYSXXuyr4KQKa9
	BFbrRHqyEf+j7tidjzfZWIMzYOc4k5lG/Im0KY1UROn/BDfSy2FlvxY8X+vEtr8hHukmY3NDOjh
	T3igL5dZwCCVGRLSzWnUOpKAMW+t4WM3L0ZHYr3N0Tmu5BVyJmfHJqBvkXcAVgVnfCH02ln8=
X-Gm-Gg: ASbGncuqhY401Kv2CPo46IZJDQgvzsgALk/JIm6dnXFRQPj7XXfOYqyLISONtxC7JFX
	ZY4CeYCYQxdBzjs43N8LCudyxht67Zal9R0NJNeOIW1+hjijxYDoLDMi3YgAsFda1ne23qpldzs
	aKzvXT9FXxD2oeLaKc3BFbWDcHPzqxzsh2Ke9Pi5GgSuZS6emZxYuGWmOGxoyE1HwqdWsdsJMZ7
	SVgeAkUoNRtjbVGga8XOkyZRWLM0pkFn9RLzyIA8hHyWR1Qw2XF9JLlEj8xRWDSCCKFUgt+gmOI
	DQAIkJaB6+1eqi58toYnWX2GggbyE6RC4gKVIrogsBuMZ53Pj/FrYWxmaPQotkJPaKChWhpGFty
	F
X-Received: by 2002:a05:6a20:3c89:b0:243:9824:26f7 with SMTP id adf61e73a8af0-243d6f3b99dmr22327987637.43.1756931366783;
        Wed, 03 Sep 2025 13:29:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWLCFA4e3h2HULrJci/u2sRbtYBFqxTbsBEzYXySZPoSiJ1k5AIwMaAZVutQz8XDR/THEIsA==
X-Received: by 2002:a05:6a20:3c89:b0:243:9824:26f7 with SMTP id adf61e73a8af0-243d6f3b99dmr22327968637.43.1756931366275;
        Wed, 03 Sep 2025 13:29:26 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772409e1e65sm13711254b3a.101.2025.09.03.13.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 13:29:25 -0700 (PDT)
Message-ID: <3d942fb1-e7dc-41cd-885e-a610bfcf856e@oss.qualcomm.com>
Date: Wed, 3 Sep 2025 13:29:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath12k firmware ath-20250903
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JhXsLiMug_aFnfnqusWjEbzDu8XjYVIA
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b8a528 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=qVH1Mreu5pg5mNMOoWQA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: JhXsLiMug_aFnfnqusWjEbzDu8XjYVIA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX7eiEQKalPTkd
 396aoUgvXjw9AnlFGCPcZjLoA1pmUzYoaUDAAYwiary1ov1w3AdwGjws7lKg8ICOBXR0iTnombt
 LEIrmUaZU14MW869j3DsO6VSsq1KLC/N30F3xFuyT8rLBfpsoch0gGWXHc3StGrmR5WWTq4mqjM
 5eO7odb/eHLJNLcSAoc+coUxrDYq9xYXdB/XmHK7l71eGS9mIALmtPnFF3yilWbEY1yeMUf/sMR
 AgyCR5s0wtQK76memJCHmdUdmvweD8ztb1z0amirrYZFKZJ1Vk0gj4j2OHk/7XCRTYaEN55/Qqq
 KGWzZvKGd79IxF6bgK0rjpoLitFcW/NGLbdowDL8YHPJUCMsMGvvejLWfrQu4vrBjdQ9xbUxYV+
 kVnSly/T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_10,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

The following changes since commit 7d59b255fba6e1c3a4b7814c028cb9f8e83e14e8:

  Merge branch 'mt7925' into 'main' (2025-09-03 15:36:06 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250903

for you to fetch changes up to 1c44d84a08bf0dfec147db6637aff593d7195b0c:

  ath12k: WCN7850 hw2.0@ncm865: add to WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1 (2025-09-03 13:23:20 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: WCN7850 hw2.0@ncm865: add to WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1

 WHENCE                                 |    4 +
 ath12k/WCN7850/hw2.0/ncm865/Notice.txt | 3386 ++++++++++++++++++++++++++++++++
 ath12k/WCN7850/hw2.0/ncm865/amss.bin   |  Bin 0 -> 6111296 bytes
 ath12k/WCN7850/hw2.0/ncm865/m3.bin     |  Bin 0 -> 299660 bytes
 4 files changed, 3390 insertions(+)
 create mode 100644 ath12k/WCN7850/hw2.0/ncm865/Notice.txt
 create mode 100644 ath12k/WCN7850/hw2.0/ncm865/amss.bin
 create mode 100644 ath12k/WCN7850/hw2.0/ncm865/m3.bin
