package danny.store.dannystore.controller;

import danny.store.dannystore.domain.dto.InforUserUpdateDto;
import danny.store.dannystore.domain.dto.UserAdminDto;
import danny.store.dannystore.domain.entity.User;
import danny.store.dannystore.resolver.UserInfo;
import danny.store.dannystore.service.UserService;
import javassist.NotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController extends BaseController{
    @Autowired
    private UserService userService;
    @PreAuthorize("hasAnyAuthority('admin')")
    @GetMapping("/userName")
    public ResponseEntity<?> findByUserName(@RequestParam String userName) throws NotFoundException {
        return successResponse(userService.findByUserName(userName));
    }
    @GetMapping("/info")
    public ResponseEntity<?> getInforUser(@UserInfo User user) throws NotFoundException {
        return successResponse(userService.findByUserId(user.getId()));
    }
    @PreAuthorize("hasAnyAuthority('admin')")
    @GetMapping("/admin/all")
    public ResponseEntity<?> findAllUsers(@UserInfo User user) throws NotFoundException {
        return successResponse(userService.findAllUsers(user.getId()));
    }
    @PreAuthorize("hasAnyAuthority('admin')")
    @PutMapping("/admin/updateRole")
    public ResponseEntity<?> updateRole(@UserInfo User user, @RequestParam Long userId, @RequestParam Long roleId) throws NotFoundException {
        return successResponse(userService.updateRole(user.getId(), userId, roleId));
    }
    @PreAuthorize("hasAnyAuthority('admin')")
    @DeleteMapping("/admin/delete")
    public ResponseEntity<?> deleteUser(@UserInfo User user, @RequestParam Long userId) throws NotFoundException {
        return successResponse(userService.deleteUser(user.getId(), userId));
    }
    @PreAuthorize("hasAnyAuthority('admin')")
    @PutMapping("/admin/updateUserAdmin")
    public ResponseEntity<?> updateUserAdmin(@UserInfo User user, @RequestBody UserAdminDto userAdminDto ) throws NotFoundException {
        return successResponse(userService.updateUserAdmin(user.getId(), userAdminDto));
    }
    @PutMapping("/updateUser")
    public ResponseEntity<?> updateUser(@UserInfo User user, @RequestBody InforUserUpdateDto inforUserUpdateDto ) throws NotFoundException {
        return successResponse(userService.updateUser(user.getId(), inforUserUpdateDto));
    }
}
