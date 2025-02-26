Return-Path: <SRS0=FM/t=VR=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED1DC19776
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Feb 2025 23:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9A73CC4CEE7; Wed, 26 Feb 2025 23:08:45 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EE21C4CED6
	for <linux-firmware@kernel.org>; Wed, 26 Feb 2025 23:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6EE21C4CED6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QM4Gwj005050
	for <linux-firmware@kernel.org>; Wed, 26 Feb 2025 23:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LTBZs9SF4fpm2lgn+jTmnQ
	7wDyI4IyFnmtDMU4kFjVg=; b=izyuXY8776lZXRZGYb+le/PtTC30f8Ensm5VI5
	mJvjWtXReWm2xUzkV2SEfSZFiLKznBWj6E/lp/m4PjdJoO3iFaXJIyNJg8F42iqa
	DyIRiqQB0sHzfj7AjtxSS18kIg/LYD6DqGJLHDuqy24oKlF41nop0apyYwgPCeL/
	xL9RVugCRksJIWQM7oMopws4Fx9B8Z/Lyo+aN9iS+2HzOuxu/80Q5aI0ro2FwrdH
	Paaz3h6IBanH5ibL0Oup7G4XNUhTLRz1YS4lnuzPvBfcYAI/Xi2241Q3XpltTQhT
	xJUuVcF3qp5RH4FbZWK1zYSENewpHi6zgtwAFd/qG9FH/LzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452be6g481-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 26 Feb 2025 23:08:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc404aaed5so1049837a91.3
        for <linux-firmware@kernel.org>; Wed, 26 Feb 2025 15:08:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740611321; x=1741216121;
        h=content-transfer-encoding:subject:cc:to:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LTBZs9SF4fpm2lgn+jTmnQ7wDyI4IyFnmtDMU4kFjVg=;
        b=ddrJhU+RYCX3twciwzexOcpOpIHNKD4bhfXeAbHfJF/KinSmgoRaeqyCgzk87TlFUe
         TZPoE/ejOX1FkvuaMZ227P+P68Q3jzNH6k3oFVLCqXYl/eRIjYQybaQM/mzdGEkTLfKN
         ic+mfE7sSp6KaOwbjpqjWr/6Ns0fNzWwN4+qFfD0NCkEiWrOam6oBL4vHLWVyUld/XQu
         u/I5VWQle19aL6liQgKpPJ1Ex+IWcTHol2Rnym4fh5ZWjJV5rP6iLjVTfjgIWKN4IxIY
         s4d1F0i4PT3o/Uc+2fMvF2q+v7NWYCr2rLC7/ZBxWhhQN5WFn8usFEzRv03SbPBUKikP
         8Quw==
X-Gm-Message-State: AOJu0Yxs5Lxy7WZ/ols2FcCkv5vGuonnyoQs/odHJBmNOuiiA4hNB2Vz
	kotFTw7za+rHJ5yxbj21pQWpJz9N251KwYFtbO6dQJgeggVnSBZXI5BwwbGBDXE1bzauF9h7FXm
	rMuqB4Qhx0ThjH7XhdMnGhDgxnr3+hc7DzZlqonAGknTXrIEqmrp+6RvxuUILNUkdFcA=
X-Gm-Gg: ASbGncsJK3FADEhZGhTZBuaLWFvMKpGwS07N+ngAXq3SSo4POR/dlY+hKLYIipQrbm8
	xTWrFAiePgPliQwmKZ/rYSZsMdjaKQQQft7vkaFdZW00qjDNpZE93/gOSzm+XjTDi6wMNwA7yuD
	WgCzPzUj9e7ZZd34LYi3zbxj+91XvWJO8qJfMK2hDVGrQCZKkcf2ZtWYLdynBq4OZGj5V3ofZA6
	2k581YjZvYsaSS6CwcDm+75Uu7+/ESOen01SMILPlFoXy8W2LUnxA0On0EMiWUNi3hSjyUKrwbO
	byZdsoLvjBEeAyqCyYVG/Oyh8ZWJlkAJj7jpd3TK19PW2PDd7Twu5U/JIdridG6o+zVn9XJVKk7
	EjptI3Pt6
X-Received: by 2002:a17:90b:2801:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2fe7e2e9383mr7619624a91.6.1740611321171;
        Wed, 26 Feb 2025 15:08:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHi7qZNiX0sKtWPTcuB/eIr8dt0T1qi6fJxqj6hhLa0VCjr9ZSHqkY938CIh8bXwMOThPw/zg==
X-Received: by 2002:a17:90b:2801:b0:2ee:45fd:34f2 with SMTP id 98e67ed59e1d1-2fe7e2e9383mr7619600a91.6.1740611320838;
        Wed, 26 Feb 2025 15:08:40 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fea6752095sm115827a91.1.2025.02.26.15.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 15:08:40 -0800 (PST)
Message-ID: <74b29af1-4024-4636-af8f-a95fa0f3601e@oss.qualcomm.com>
Date: Wed, 26 Feb 2025 15:08:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware 20250226
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mJr6FHQNCfjc6ZfW1_WjYMlXqOy5F8FD
X-Proofpoint-ORIG-GUID: mJr6FHQNCfjc6ZfW1_WjYMlXqOy5F8FD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_07,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=886 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502260180

Hi,
Here's a new pull request for ath10k, ath11k and ath12k.

This request only touches ath11k, and adds new firmware and board file for 
QCA6698AQ hw2.1 and new microcode for QCA6698AQ.

Please let me know if there are any problems.

/jeff


The following changes since commit 1a1470d90de2a25e5befadb2f1fa30758af682ca:

  Merge branch 'robot/pr-0-1740366711' into 'main' (2025-02-24 05:26:03 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250226

for you to fetch changes up to 811bb52b1d293c3a9641c8747c8963ade18b7e81:

  ath11k: QCN9074 hw1.0: update to WLAN.HK.2.9.0.1-02175-QCAHKSWPL_SILICONZ-2 (2025-02-26 14:53:32 -0800)

----------------------------------------------------------------
Jeff Johnson (3):
      ath11k: QCA6698AQ hw2.1: update board-2.bin
      ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04604-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
      ath11k: QCN9074 hw1.0: update to WLAN.HK.2.9.0.1-02175-QCAHKSWPL_SILICONZ-2

 WHENCE                             |   5 +++--
 ath11k/QCA6698AQ/hw2.1/amss.bin    | Bin 5132288 -> 5140480 bytes
 ath11k/QCA6698AQ/hw2.1/board-2.bin | Bin 866120 -> 986384 bytes
 ath11k/QCA6698AQ/hw2.1/m3.bin      | Bin 266684 -> 266684 bytes
 ath11k/QCN9074/hw1.0/.notice       |   4 ++++
 ath11k/QCN9074/hw1.0/m3.bin        | Bin 340108 -> 340108 bytes
 6 files changed, 7 insertions(+), 2 deletions(-)
 create mode 100644 ath11k/QCN9074/hw1.0/.notice
