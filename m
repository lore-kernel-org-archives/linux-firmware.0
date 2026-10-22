Received: from smtp.kernel.org (ip-10-30-226-227.us-west-2.compute.internal [10.30.226.227])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B27606A31B
	for <linux-firmware@archiver.kernel.org>; Thu, 22 Oct 2026 17:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jBxbkPjm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DSCrEsJB
Received: by smtp.kernel.org (Postfix)
	id F2FF11F01829; Thu, 22 Oct 2026 17:50:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792691420;
	b=dLGk2itl0yhkGhaaTI7sQCJd5m8godTeKDGGN1bKezmjf21kXagvjnluBAhkOcSSEVuU
	 3FaorYD8q6AEa/sH4UmjyD9jj5wug/8/5wvxW/G5/FZIggNRI9gfvLca3Z9fb2gJjJj4H
	 jCrAwaayOjM+ZOWLyM3AyhyRu8IMvzZAeXUaH52cEaFpQAxgXsyU64KoYs3hb8k0lWYXK
	 sEyPpFyhrz66e8uVp4is9dt+RSB0cNgu0+XGe6RA/6jtNUE8C6mfj4KupP72CCnZDQA3Y
	 7Gqm4eyuqrPc/ZXHbKIrbt5Phh7/iKM8FIb+56K9XO/b10RG3U6orZczNh8z/00196Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792691420;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=;
	b=KR036ecnO34KVTpgq+d1sOCLN4QIBOPlCU0Ncy0kNauGHaw1yE+xCBkPzukKqzvFNJqu
	 KwALWUOJhlmx8yGSdWR8U0htOjW22s8enLJIvK+yy7wCQBZZLyWNtJbSAxPgFVbq3PqSC
	 /rpf6VNcm00mH92tcIIBnEmRshnbTnISO3OHCOB88CW+9Rset4x4Cv10p6IK0HubkAx09
	 RsQ+qhdP4RrIbfaenQ0YcRqhR/Cc4NrePxbJ1sK/ruJ+FE+0/xr51JBAcGKMMG8489Kkd
	 EUDZeWl7gpxlyjeNKLOoOnYv2ohPlTKFkXPx8KR5zhLVkmCibmA/ohXswK5TdqC9iKw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jBxbkPjm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DSCrEsJB;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 604221F01825
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 17:50:20 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jBxbkPjm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DSCrEsJB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 604221F01825
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFoYk2595375
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 17:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gugNWHoGVfRUDNY8Vu+7gr
	h/eYK/jhHtdCQenYRhq5A=; b=jBxbkPjmSWBgZFfe9z5p4TTSrX7oxGJ8YxEtpx
	U3+FwdYuMh/PmrSH9Plo6+C+IUDdbJJTIeHlCcxc+U+XSk86ggHymLs5oKbyModJ
	yMikKvui/bkVVD9NNBWiozG7Hjn3yXPiUCUXIR3/HdUe7Ne+P2MvB43+79+UaFDL
	FA8CT1g5GPy/ofhuM3J23uY1k8tBVnB6TO3eAuPh/RQcV0JDPkAtXKgHAJhazYg4
	EEO0AD6Wtjt0g2db3ePVHiVY+GT+PwplxrTwZuGWUozikth5H142Av1KGPgf7mW2
	6vzqwj1dq7SJSwdcGG2fo8+LQt6M/ul0Y45UQZNie8dKyVSw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93amu2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 17:50:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-151ba226e1bso30998c88.0
        for <linux-firmware@kernel.org>; Thu, 22 Oct 2026 10:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792691419; x=1793296219; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=;
        b=DSCrEsJBtwqanw8IKyCylun4s2Ra+HTkBdQoMiN49EqWNSUinthhZ6GLmJ7CP8xY5I
         9QNW0yvM1ZuYTkRo5su1qtJW1ITn7IIYN1ckXieNHZTFdmSB8tfSNw2m3RSnyqPiTsj5
         GLfS53sR2a4SGxukzLuS2UEExN6QLT9uGOLSwm8O+TXi2UHC9F6cwHGrclgx1b17r6J9
         KsCWAC5a1fLgH4LkDB9rpDaHn/45q4aN9hwSh8ynwd1T5CU9TLMB/gpvffJQ1EYgYOhy
         gcTxlpbqtO7U6xRgh3fNcViPJyCN4K0Zo5XkCAntrxpjwtC+7vfD1O5tKxOjBfD3ENcX
         zmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792691419; x=1793296219;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gugNWHoGVfRUDNY8Vu+7grh/eYK/jhHtdCQenYRhq5A=;
        b=KZG1HwlsZZomx0hmc++E3Hpkf4U2kKKy1QB4cPfqlQRIsNYTofCcmBqYORxavPsr+z
         /pXIscyWKRysi/ZZ711Csuzf9TQLn8BWdkiAPAG93A+OomSbKyoJ0GY4Uqonw/l7OGsP
         KirCRYs/EyWc/alsiPHGBQLyvM3vS5ir6XMuVCWH10cxMS44Y0iBfcJp77Y9TtAeTkQZ
         s2amiW2O7t1/WxXP+bVl2D5Bg6CG/Mm7NeOj/Pm8pov1BLPPRG/ZQPxqkVo8bN0QLuGJ
         ZMV5jUHRbKjBAVfiO6q/gpDXs+eubj977oDjhuOqqZxupExNdTwUxrEkktClQ4LUPRIa
         4Kzg==
X-Gm-Message-State: AFq9FYKITQAfsOmp+RZPgBeGgdmNVQDppnweUS8w8YAqKOh2f0i6XDLk
	gU/+KFpW8EKTpUBzyOpP8felGJcZuxtUsohmB6nq12L+azEaVISlptip5dly9oti3coXeqRXLQ6
	piOwfB/YXiwgd4XDq+TYmGPLg3xvLLrrGyQMvUkyJ5XpvSqV1HuMAc9j9TeWzBn/3pTVRWtA=
X-Gm-Gg: AYBFou0GfHiMqBRzaeLBifHpabSTIech996pZqKZ8kNNmk3Cql4WpXyWLui8X+XvYVc
	Pc4tAHlt+3qXN71mCHW/Q+G5/497RJbW7fZFi8BDsh1i7q3XxVdXvCgtDPV8UHxw4t3wTl5Zuej
	gL1lTlgEe4xgNL4yZZyHUXOGone9gUddiu/tkG8uaI8ZzWWkez0BOC44Pa8tGWV9A2IkuQbNXu5
	+5kvbImKUlLNW5y2gUYXYjuj8Gd6i8ISAALdYm5WXUPKgXf6erfKAzH+uE/yr85Cg4AS0vv7hqZ
	eRJVzzsQVIiJ4itlC+O8cNlKGhtwOohWVkrG5W+4CbZcrGBdbH04/WGbfZYdARGgC2k/CFc5cdw
	aRM5RTQAH4zAgdLM5R7C8AUYAsd5N96wa3mMo
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr9771921c88.7.1792691418455;
        Thu, 22 Oct 2026 10:50:18 -0700 (PDT)
X-Received: by 2002:a05:7022:2507:b0:151:ece6:b16b with SMTP id a92af1059eb24-190a4c1fa2emr9771872c88.7.1792691417718;
        Thu, 22 Oct 2026 10:50:17 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195a7f440e4sm140975c88.7.2026.10.22.10.50.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 10:50:17 -0700 (PDT)
Message-ID: <b1845835-415b-4c20-91c0-fdb23de1e1cb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:50:15 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20261022
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfX1gw+yGbfIzoR
 YetCFHiZZHgK03dqWtFL9Zd2TnSsA2aiblnETu/VIriobED6ZR4mac/m0O/rcimsP9tqT7sZ/sl
 2xB5BDzqfmgB0fXls1ly34WTlEMFGGREe2cZsD0yTManCHjWMYEFsxiK2UpuNt/yqnJR+PtSHJ1
 YhPGJJHgqQ3sgFh04Rj14mtTDEqyspeE3nnLW/8TUOtStliC8YU06Ja/lm8Vilwv2ICIztc5NPy
 mVODSk5YdqkeNRW+RCgH4IqRlw6vQyJmUopXZJPFgdCPpTpp4mbIoa3Cpi/C2oRdnKggiUACXOX
 qJl+CMJkCLxETg/rRyzXXojPvuDR9xmNZ0Kn10SxXWe8RINg+BISM5iE5bh1/+6mEOvIYL0n4vr
 JrP2FBkWDrg3vYxGhV95e3Qm02n/koKMHE0peA5aFU97VWqafBqfNkd5O6yKnZP1YLWyUJSmmXy
 oVyhddEAvfj4njyelnA==
X-Proofpoint-GUID: uxJshfEC80m_d3tRoBNRuDKQl6TXFWab
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ada4cdb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=wC-Lp9yRyfpcNyighFwA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: uxJshfEC80m_d3tRoBNRuDKQl6TXFWab
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA3MSBTYWx0ZWRfXzAZFLMyOeI/x
 SKpIu29JrgMepxe6xnVl5FO4k2DTQXE0UahntAE05tf8vDCHhbIYBj7yzIj+a59SGnhjzqDkm7v
 AHY8GLTuNuWpqnMbVwTa4ntnxkjUICQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220071
X-Spam-Status: No, score=-21.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,
Here's an updated pull request for ath10k, ath11k and ath12k firmware.
This supersedes the request for ath-20261021.

There are no changes for ath11k or ath12k.

For ath10k update WCN3990 shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit 00b1df13f9d0adebcb90bd110a4a22de5115e077:

  Merge branch 'main' into 'main' (2026-10-22 09:39:18 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20261022

for you to fetch changes up to 72f3b81c89fbc52677b9dbbfa92cde0ae00a36e2:

  ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226 (2026-10-22 10:45:11 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990: hw1.0: update shikra/wlanmdsp.mbn to WLAN.HL.3.3.7.c5-00226

 WHENCE                                   |   2 +-
 ath10k/WCN3990/hw1.0/shikra/wlanmdsp.mbn | Bin 3811820 -> 3808072 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)
