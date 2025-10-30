Return-Path: <SRS0=Su4V=5H=oss.qualcomm.com=zijun.hu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91345CCF9F1
	for <linux-firmware@archiver.kernel.org>; Thu, 30 Oct 2025 10:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66338C4CEF1; Thu, 30 Oct 2025 10:50:21 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72353C113D0
	for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 72353C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9PF1j3509177
	for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 10:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PWlfjsr90o7MuwcQnSmQXI
	S0sAdqzis2nl2PIUsiO7U=; b=Otzqw23Xzr6DFs6BjsMIoeBEPRjTGuF6SI0FEf
	QcBJU0Jh7dMqmGVhjjarqu8a1Sol+6TmOIv2ntq33/mGuNjDPKg+2266yyNfhzKg
	bOadNAGbMLzRfILH2ZUoYXCJhLfq5VLY+FEnpa39BgSPZdATuPj6mGCPL6IddUBI
	YM6zebpeDg1tNUA0ovpXolqblgOpKzeTV0Pkw0jXhkByAcDL73AT9gG1kWa7azfQ
	Lj85PMsUMnodXV6tBO2bGd5q7myl8LMV82gQHeTOhku1kNZ5onxmigSfqt4cP6Bk
	/JnrNucfDy7Ex+HtAs7o6pr/SMuKk9JxrtUWcNU+w1kcp/yw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a45cdg84h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 10:50:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-294fb15cc98so572185ad.3
        for <linux-firmware@kernel.org>; Thu, 30 Oct 2025 03:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761821418; x=1762426218; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWlfjsr90o7MuwcQnSmQXIS0sAdqzis2nl2PIUsiO7U=;
        b=fMPdT+H8e+vBKyGsxL4ZBcSPm9oWRQ+ofS92AdLqIZCO6znUsEqELY0I1gunFAYE2R
         jE855QZdIZ3Jfvs3ozCjdfxmStpDINiO+SAoCt71dkz0PRADsGsJPU2C5bZMo41cYp5r
         NMUVLe/vD0drzMAqoMPjE+4Hza2749QxElNsA1nCR0ozDfXK/tBC+tKp3ncsRpDoC1DV
         /wSRd1UyCwaOZ10ucJQEUvyzqe8qOWxZelvGL3LUHp0U5Oyc/4bT93wuaKYuCFyVQ2AT
         k5E6ePv8CVJEG1Eye0f2oOMlCAvKK47UtBMUcNb7u4bOry0D3rRqhTUpPvLu5jyU5vr8
         gpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821418; x=1762426218;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PWlfjsr90o7MuwcQnSmQXIS0sAdqzis2nl2PIUsiO7U=;
        b=ejc+uHid8KGq3Jj3va7wZw9Kb/A46k/QQzwMwPcaLHjCOtNW1E5p7/0kS8bQoXWqUr
         Zv5bra7+zQg0nVFdZaTvXldMoMUwP3y2bJJp9bUb+6hEKhHgtZz+p1Aoni+1Ek6j4uLq
         CfXL7QdPO5vy7Vra6FSf7AU5+i6JXSiK6UBU34BmQtQiM38RHSy+N6rd+KfNaAHq3pK2
         r+tjn6Wxv8pAeuQFRs+4Qz5fOEzGhGJu58ay3wNTbUaZctwGoHucjpt7NwUmJ9v9JXv3
         cTNHo1u8f7XPCvBizU+9oodMy3zMsleyZ5bKKjlSdjpj+DnWO5/z8YIPT7p6DWZMu5kW
         oCvA==
X-Gm-Message-State: AOJu0Yyt6WkFCYhUmTZCQQ2wkM7AIVizABQB1Uv4ZI1ULWT5pQ9YdX9r
	RRB4ct6+ligwgtFs8dmm+ObI5qp8+Sp+DXfxLKdIdwDWaopT7R/frq17IFtHT0509Z6tuCACXFr
	PVrMVpXet0NV0TjBYvmC6NtVwSreSiph8WAY5LLmEcMPkyn4OcTHCwH+wwJ0v7OIbIBxtEwE=
X-Gm-Gg: ASbGncv/1l+JJ3DJI9QnZ4+MONhVVndsSMRsGVgdnShqnLj0hIQsJ64mghRrRSAVAuB
	Jjqd6WH6cAbspYA+T7rZRZw/jxDNgiTCxxQvaFHaQGXAGsVAds++REcA7/NAe9VI05KqsNr/8l0
	CbDMfMcTNpGSFc0a8VxV+vfTIPLBqor+Q3L81gE9E6wUrmRWthPD0TIecphK5odHQR1Lw5bSCDS
	3KwsiHuqDYTkzXQdH24s2oEzFMXw4Mh0fyOZQe1hkP1Hq3ww9LDBdHAf84JyGYfvaID4/sJYHn9
	nd/MhqADab6b0NBvWd6fFavmYHpG3XwzBWrHHWr8j4HGXJc3I5KV5womV7tWJc3ZdGs200Fankl
	ysQlK+7m8iJjG1mnHpZkwDiy91v0+tdaQWblKF7+1AIkxIMH7Gf2rNEUNEq1EMlnw
X-Received: by 2002:a17:903:2f85:b0:27e:e96a:4bf with SMTP id d9443c01a7336-294dee178a1mr41075125ad.2.1761821418442;
        Thu, 30 Oct 2025 03:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi56xca5WRAvvEc7KZCkaplRLe3ZUpSJwTmfk+jgmBZ5mrcXgudqXEHekhW+32CukIpAxF7A==
X-Received: by 2002:a17:903:2f85:b0:27e:e96a:4bf with SMTP id d9443c01a7336-294dee178a1mr41074935ad.2.1761821417878;
        Thu, 30 Oct 2025 03:50:17 -0700 (PDT)
Received: from [10.133.33.46] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42f34sm179875485ad.106.2025.10.30.03.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 03:50:17 -0700 (PDT)
Message-ID: <aa746f58-c004-48ea-ad75-59813f3c3252@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 18:50:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org, jwboyer@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [GIT PULL] Bluetooth: QCA_BTUART: Separate firmware between WCN6855
 and QCA2066
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eRLMElCdZ6rJNeQzDXGNWDxkrf7LdNB4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA4OCBTYWx0ZWRfX4WV9zZLfRc/r
 1Vz8lYAT6hrXKvz4crmj8otVzx6ClgJU7qguC/IyrBpJzxlk5SxDTiu8VzV3joO6LdPDK7lfeUV
 zZSBtUtyUc6H2sa30WCuhAk2RevUVuJR87Ffi1hCuLomnG61OVoc3taYI0A1h1MyoojRBsZTxIP
 lWNlt+dGzeRXwOJW2b+QV+u/Zajn/U87xe5HWmUE34jrtKCrwIJlQZImeYUhCDXgZIeyVtyMx1U
 ZuRvfTqOEWd4mbDjNThlFvqxdWXQEh5wicU9PX91WY9hJ/1QL/7k/IqnMnO4g5ZhJxe37s/ocin
 gfz+klfYH6ky1HXQbFzwYZi+127n3pgl5QuMdNZC4eih4u4zFXjLxsZdznlcu/Vs4n73377N5vP
 5Kba+eQQoGDjf2OSCZEC2L471lUSDw==
X-Proofpoint-ORIG-GUID: eRLMElCdZ6rJNeQzDXGNWDxkrf7LdNB4
X-Authority-Analysis: v=2.4 cv=ItUTsb/g c=1 sm=1 tr=0 ts=690342eb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=PHe13IdSKwn-Jw8ctjMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300088

Hi linux-firmware maintainers

Here's a pull request for QCA bluetooth driver. Please let me know if
you have any problems.

The following changes since commit bfc84303530a1cdd603fc40aa25b4452f10870dc:

  Merge branch 'mt7925' into 'main' (2025-10-29 11:21:38 +0000)

are available in the git repository at:

  https://github.com/zijun-hu/qca_btfw move_qca2066

for you to fetch changes up to 45b3867b446ec97326ab4d5a5cc81c9f811132dd:

  Bluetooth: QCA_BTUART: Separate firmware between WCN6855 and QCA2066 (2025-10-30 18:21:04 +0800)

----------------------------------------------------------------
Zijun Hu (1):
      Bluetooth: QCA_BTUART: Separate firmware between WCN6855 and QCA2066

