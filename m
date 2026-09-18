Return-Path: <SRS0=dmt4=HK=oss.qualcomm.com=jeff.johnson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08967C982DA
	for <linux-firmware@archiver.kernel.org>; Fri, 18 Sep 2026 14:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D36561F0089A; Fri, 18 Sep 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1789741178;
	b=vcJojOLjnz441NfYXlkKcniIhgZvE4CiND6GBD7XDXORY5yXABxRRjBtRyCvjRelhnE/
	 5ar1l9I/fmMVEE9dS3W7Hl4Muy1EHFZiEQlI2M7vTt0PvmVbQiQqZVWzS8YU2vtrYD17a
	 MuDznbG2T93Mnq9NOpK/PbEEqh3+Xbdxw9nwGHCpRr98HFYof+Lnvd8rCpU5zlHpq1Lv9
	 f1L86KJKYMLjOCEQKobYKvbLep+Zacf1uPQkOBvPONfUcK6L70JHXskhlF6FQY+vokwkC
	 CeHnzA6AK68ptLJvjguEUGyjNlJ1+5OBs8WG8/Owwoo/H3gMwPPEHSWWtViHz3Bg3PQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1789741178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:List-Id:To:Cc:Subject:Content-Language:From:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
	b=VhGpUr6YxqpJ+alUaDFiDdoQMuIARCdg1rkPGL7+rAyaCajw9wgHauG5gzpgQX490Bjf
	 s6IdJC/V/Ax0Yn7S7qi74481TyIiiKbvgeF+RzliZPopjj6KL0UZUkRZKzk1MveyWMj/I
	 MUxhHB715LSPkRLdK5OvOVjDE1n89fDC1MKEMx9WEZfjRCkBjbMR1kI4HGnJFKl8F9hz6
	 KKq1Oc2BLA9/YH+IyttNonnPAZC8YiGdG52/7uemoSDNQFeHpSe3kJT4xhZzx97XhHyIf
	 BGnYw3hYyrQV5NlP5fkmeqb8YHTGh3b86aWYtn3xNaA5GCvBNY7Yqq0FPIQbfHAmjpQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DobeeqdU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPDtbNDb;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 19F401F000FF
	for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 14:19:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DobeeqdU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NPDtbNDb
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 19F401F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDP5Sb1202873
	for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 14:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UVIKTbOX8P65rHjj6Gpe9j
	HcXhIM+KLdiyQqTjwwzPQ=; b=DobeeqdU60kdMGy3DWDXi/byxGfySY6l20JjUM
	iMDRkWre2xMXVhmLSxpBdCvBMDKYgGsggnLMEd/BrUiY8ed6rD+rYpjL4e9GE7Ko
	Byt32oiN+dqu3SW/hskLiG6vob2vuFnhY6LBVchwAfVg87e4v9Pe2javI6yB7/sk
	DMGiwZMSvka98KyaWIbT/TcFOMKTfNz/Wd6lHw7gyZH1hqkjponf/9Hzr3Du3SZ6
	uHpkTgm/+X+vQlIzNPZdhFpWeASTkfklOqvYvFzaoGN0+MO/Ne5Kh4Z2/1uwoghd
	wOf2d2O6PQLWwzMTqly24/pRUzaSzsP0s8t5aVR/k3kk5ETw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grxp2t56a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 14:19:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so973219a12.3
        for <linux-firmware@kernel.org>; Fri, 18 Sep 2026 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789741176; x=1790345976; darn=kernel.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
        b=NPDtbNDbwQXbVTJhQGeXb9pAiIkJr9lyBnISO12NCLRednOxRDA45tqFshPlQc+gDd
         Rdc3yO1XTnDQ+Lx1X33gGGPlEou0n2gW0CijdX9VknVf2s9AsXB2XwXTdC6FC7X6tz5y
         m4UQjRkVU3eQA4jurT7XSyID2VVlPpCK596J9fsDspcw0WrvYtEUZTQTjiV754SEHJLQ
         uzPgmldR+GDunCYB7VbNnY4dzPkuZlLAhyDnxDTIbFn9dIIoV+FXjl2obBZRyX2dBBVg
         7K+ibApt6lQtoFCsQJH3uwHzOMkfaPVg+Z7hIUaLB9beCGz5uHWOOBUNWPhqRJ4Kpn4I
         z5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789741176; x=1790345976;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UVIKTbOX8P65rHjj6Gpe9jHcXhIM+KLdiyQqTjwwzPQ=;
        b=WtaHJ6qvLop3PvX5ZgNT+dp8ObmC6RkgdgoMn1HsW73pBrxym469tlmrHvEStNSv2D
         baDRrz3vW9DmwB1yfB7skV+Uyz+VsnrtOTb6RO2VHOGvDsISLr0yUMKY/5gDrNpZNQJ6
         TRFDiYzyixmOYcuoFy31XL0W5syluD8wfJNbXNL6ITAohyqcKoSFVSgs4hr696wbGvUi
         BMaSGec6fMdzYERhXe11nqZsJ24MlUVoUJUutocwSbL6Up6nIqUEqqju1AD3aciR/NJj
         gokRMrrJEe4w3mwrJ/PX5gCmLMcVxHOXlbdH4iabBjpu3wZRI7zltoXoP3cbrhQqG016
         ElOA==
X-Gm-Message-State: AFuF++kKFH93hP7Ij7P38F/jy5DCadgEQf3BghlqyY0XCrPefsgOuOs2
	GliAEbr6weN5oKWxvjSX3YrfkCGEzJhP5/I1xfYn9u+yL9UvQR6P+bF+72fvI4aJP8o89Tls7WA
	RMht9EtUewMKUqeSM+h58IvTDz9EHDehw5e5hzvwA9slpxDYmW8nAEC6bg/oKWqLjUJNwPZo=
X-Gm-Gg: AYBFou0DQdMvVOIOKSf3MzJDuMEvphtO/UPauxBCE7KOb02fUarLooMpuMseorNMH8M
	6Y/rriz6O7+mG3s5KSp8iRigPxBtG0mJhajggJtMbjb7xrmW+lMxFS4TM8A3Y6Yg3Y4qjk7C8gZ
	aj688gZdkfeqsiIxFvXUU4viQgaUCURM6E7Zer3OzxgIkYoEAT00SJL2Uk0b+QTqjTPLM8rSMOj
	e8o8t1KxxdA4Cg0Iqa63DFQ9QB7ob+xzXs5zqwByfzWhx5xgDLQAgMEhlYn18YN1VeMFpBCfdCN
	EEJXg0We5H4NyR62x10PMcuIJN3V7renqBnULWYnniju9Fw5fVjwx3ZlHcpnKo4muWF6oBk06lo
	TUNdo/imbqLeY6t3pwfORVt14NOU80VMRZtZA
X-Received: by 2002:a05:6a20:eec3:20b0:3dd:a006:ed9a with SMTP id adf61e73a8af0-3dda006ee10mr109626637.48.1789741175746;
        Fri, 18 Sep 2026 07:19:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:eec3:20b0:3dd:a006:ed9a with SMTP id adf61e73a8af0-3dda006ee10mr109582637.48.1789741175140;
        Fri, 18 Sep 2026 07:19:35 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50c821bsm1100001a12.22.2026.09.18.07.19.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 07:19:32 -0700 (PDT)
Message-ID: <bb9ea6c5-67ee-402c-a007-46c9c7727632@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:19:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org, Troels Vognbjerg <hekatombe@gmail.com>
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260918
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX4iOhIxUXBlmQ
 39Pm1nauopYSfAHcZeMrZI7kYrexeJuoIuy6vh0OqkKneP4eXadcS3nPokBeq7OJ4DgXqQFyVJU
 mBG/nREdn5QDWAtKhEcZIRqlYEcbGjw=
X-Proofpoint-GUID: R8NgANT2LFJc0M_vSUYm5iX5F4J_6nwd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwNCBTYWx0ZWRfX8SEvE8Rnsnhs
 G0hcuc/Q0bXWVvb+3pNs/rhjX41juiRiM+59kDfjwCFTx19OBMw29jc5sAVIKqSezH+HlKh1srf
 ksNgjLs3oPF7OSgnqTKlrr2cFohECecEBSaruEebbgVNw2Y7b7hQAam28RHxISKbTd6+8eyAZdk
 gPwlpB4I8uBK8U9JATh98rhDyf/XgZo8BdV4E48SzzoLyz7nV5yHTLeLuJWBQuod/qbEYAzTiFO
 n3E5t8fIHr2iSCqNxgKzqm/ghorG2+EzVKBnP58duNzscnY9J174F4iJkbAjwnC/9q5hdwpZtI+
 Rksq5Gny8Byddb4D8tUodrGjTKP5R+jIw8WejI366PCVk8W/fZfZderYfUxQQ5+QRfCQGNw/yfW
 3VLP6jdnWZ3/TCyC9C4CGH1nPhiM7WERB9JO839KN6QcYitma9lFxetGQFZlP9AM+7PCXxBvCBj
 3/AnvAbhs3+vnKBf9vw==
X-Proofpoint-ORIG-GUID: R8NgANT2LFJc0M_vSUYm5iX5F4J_6nwd
X-Authority-Analysis: v=2.4 cv=cNF1IVeN c=1 sm=1 tr=0 ts=6aad4879 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Q1qRzZT12ma5ygSj1D0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180204

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath12k.

For ath11k there is a single change that adds four records to the WCN6855
hw2.0 board-2.bin that cover the following devices:

bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=910a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=910a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=940a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=940a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=18,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=950a,qmi-chip-id=2,qmi-board-id=255,variant=UX3407Q
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=960a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=960a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=970a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=970a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=980a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=980a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9f0a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9f0a,qmi-chip-id=2,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17aa,subsystem-device=930a,qmi-chip-id=18,qmi-board-id=255
bus=pci,vendor=17cb,device=1103,subsystem-vendor=17aa,subsystem-device=930a,qmi-chip-id=2,qmi-board-id=255

For the ASUS Zenbook A14 UX3407Q records the following tags apply.

Reported-by: Troels Vognbjerg <hekatombe@gmail.com>
Closes: https://lore.kernel.org/all/CAPMyOuCk7SEhPvcNNQ3ZMUf=uH=e3Pp0NHf6zLoakrSvL4qEoA@mail.gmail.com/
Reported-by: Mohamed N. <private bugzilla e-mail redacted>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=221853

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit c9f6fc67b4833a0e4d0aee2554d637c49f997329:

  Merge branch 'eec-eef' into 'main' (2026-09-17 14:57:59 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260918

for you to fetch changes up to f8d2ffa59894c9f8858585eecc968d63aee6f46e:

  ath11k: WCN6855 hw2.0: update board-2.bin (2026-09-18 06:42:58 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath11k: WCN6855 hw2.0: update board-2.bin

 ath11k/WCN6855/hw2.0/board-2.bin | Bin 7237392 -> 7479440 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)
