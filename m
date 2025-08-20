Return-Path: <SRS0=6TGP=3A=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7C1CA0EE4
	for <linux-firmware@archiver.kernel.org>; Wed, 20 Aug 2025 15:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 49124C4CEEB; Wed, 20 Aug 2025 15:24:41 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7BC5FC4CEE7
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 15:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7BC5FC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA48wl019721
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 15:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ieO5QYvlXZ27cvWcN7TcUC
	qXSIjOdosqMsk86g8EQmo=; b=VKJaRiT55u+wuZYcGP8KE/vctxooO0A5jv4jVk
	RyLaRFlpfdDWcV8vhqfhsDmYS9/s3knHZ0hXB+jpgmvlWP1+5qgI2VdzwbdJyTeC
	VM1tq1ObC4n8fCKqoa4weYjQ5QhU1LFG2BNQg3YlEtYdbCdftMoPIdU96AstXT+Y
	qqbZ1nudl1vYg/fInjOgVt3Z0hQZvOxGecIJEo9wHd+e33c3dovXiPx6yiY40+lJ
	cTI1u5l3hnzIaHt4IUMtomd5+6hmP9VlJfthSTd7715YkFH8Q75a1V7c4u1WPHTy
	y0HFkkO5VCM9+Hm/rJqaD5nVr+RWOvKk16V1a7J5BRvi7JFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52926mk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 15:24:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244570600a1so104975ad.1
        for <linux-firmware@kernel.org>; Wed, 20 Aug 2025 08:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755703479; x=1756308279;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ieO5QYvlXZ27cvWcN7TcUCqXSIjOdosqMsk86g8EQmo=;
        b=pUX3fwA/A1VXuyIc+6rlWYIWgZ76MpqzlCG6NX6LAIzAh6iV0WqIeQ9SofRCbPA0PD
         qyzsa4bIHO4GCnEuFxaqMWoVVVQ+7mPMGB153LWW7w0k1Aict108o+EcYIc2/lu1gzzh
         5NPYMC44O1laz89iUfVCx4ZZTpEFwlZH/QJEeCLZLxPtf7NuB4dtbeXrOAFoTB+0q5nJ
         KCQ4pH3dwS7zJAkoPbm5x1FsJHe55rFzHO/9dpRzuzrycNGCNRlUR8n2gcuNanAJgFYw
         ha8kMPIL4E1ZRzOgF7VCcyx/sDGdg8uGTjQwJz4qfAeaFtccYrTsD6VhhmVO7wDOdU4+
         hUFQ==
X-Gm-Message-State: AOJu0YwS+uCGh1JxrqhVZvHT4hc+COLjecWPLbWiJ8nuze/m8feZj+OI
	rm1apDeVABmLhxBRvLKGksZtwVxeT5MgmFAB1jgrroimWJZYK3pMSBh6kAOoGOTno/e0NU6Fun2
	LBO9VukDfE9fr+xdvQl7uuumUWvI2hBtjfjOAWycOScebimMOWK2762bl1dyENTsrwWt5Ww8=
X-Gm-Gg: ASbGnctN3klpVntnuiS1faXBvZzJnD0g6xjx5R64iTQxl1gXRtgjnvWAyuHb3I/Wy6p
	X7HxVV2XaR5o1iMuOUMvJB19nlfwWy80vTAOdqS1gRwbD46kCtKq6iSAjwAUm+54Z3lsHL0tXA7
	K6RVr6fo3g0COPRwJWq22u6AhLiU/p3dHoCK0jRr4gxrVtxTXfCv5Tk6F7JGNEtr3l+cEgmpGj5
	tY4lMhj9gfvC9ewJL3hgoFaZ46Z3klPRGsanFmmP7VZonZL4mGc6kcqOmzcVYN5MQmqs7njpOA7
	Zu7HqAN9OfPfN5gOTY13osaAurekxlQWPGzPdKczVCfTn39N0JsTdghumbk0NUXVXpC300/x31r
	H
X-Received: by 2002:a17:903:1205:b0:240:5bf7:97ac with SMTP id d9443c01a7336-245e09d0be4mr86387485ad.16.1755703478633;
        Wed, 20 Aug 2025 08:24:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0VKBXRsV4LWznZ8KguG4ys3hOJb+MIIxxdAz09Ju4QNnohG2o8peVOrH0bhoqJVc9guMWrw==
X-Received: by 2002:a17:903:1205:b0:240:5bf7:97ac with SMTP id d9443c01a7336-245e09d0be4mr86387125ad.16.1755703478206;
        Wed, 20 Aug 2025 08:24:38 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35d511sm29919525ad.50.2025.08.20.08.24.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 08:24:37 -0700 (PDT)
Message-ID: <323382be-397d-4df6-976a-89319fe97202@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 08:24:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath11k firmware ath-20250820
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yltXF8H5hgWa_z-Cz2yFmRtM_OfcGRmL
X-Proofpoint-ORIG-GUID: yltXF8H5hgWa_z-Cz2yFmRtM_OfcGRmL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4oQe3M+6Y+hA
 B6LylzNgL46vuq+mZvzgsiRBCQ0PgM16zjx4PThZ3pPeK0WqCI4jF9wtqO5b0e18emc8PVI5J89
 pU3zbD60yAJoLvoo/MGk0xT+RVzH9NDrBEIG0rwzrJFpOKVpyVA6DAMDDbJwv5lmkkjz2Itc7D7
 ZtOhD/sThX2CE8B2PKtki0fhB0nZxS0SPEn3RrdZk+5XVwhKxQqUvNyiSVktYD9dEDG17Arx4uD
 aoxsXvRnWcB/oFFKBhx0ZiNd0WZnX8Wi4Sp4Gug6PunEhkodqtk/NX8a3PFDiancz4XeQApGV5F
 H5FTjQeg9f+vYkmO6U1avewEEMxbpjLNR2scNmCucOfs4ZrzrG6riIWqvpwNNUy+yinQUZBYLTT
 LUkXsuvmzKPPFOootmAdmeb4fGubVQ==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5e8b7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=SvOVevs7hV0f9PBrymgA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_04,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Hi,
Here is a new pull request for ath11k firmware.

This adds an alternative firmware for WCN6855 that is part of NFA765,
optimized for IoT applications.

Please let me know if there are any problems.

Thanks,
/jeff

---

The following changes since commit 5dcaa87d4035f437acb9d8817d88b26932269863:

  Merge branch 'robot/pr-0-1755692386' into 'main' (2025-08-20 13:19:30 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250820

for you to fetch changes up to 71b945d2190cbaf6bebe8c1a8b0b41a71d65ec31:

  ath11k: WCN6855 hw2.0@nfa765: add to WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1 (2025-08-20 08:01:38 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath11k: WCN6855 hw2.0@nfa765: add to WLAN.HSP.1.1-04685-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1

 WHENCE                                 |    4 +
 ath11k/WCN6855/hw2.0/nfa765/Notice.txt | 3658 ++++++++++++++++++++++++++++++++
 ath11k/WCN6855/hw2.0/nfa765/amss.bin   |  Bin 0 -> 5005312 bytes
 ath11k/WCN6855/hw2.0/nfa765/m3.bin     |  Bin 0 -> 266684 bytes
 4 files changed, 3662 insertions(+)
 create mode 100644 ath11k/WCN6855/hw2.0/nfa765/Notice.txt
 create mode 100644 ath11k/WCN6855/hw2.0/nfa765/amss.bin
 create mode 100644 ath11k/WCN6855/hw2.0/nfa765/m3.bin
